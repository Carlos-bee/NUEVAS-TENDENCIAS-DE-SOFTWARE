const db=require('../config/config');
const crypto = require('crypto');

const User={};

User.getAll=()=>{
    const sql=`
    SELECT * FROM users`;

    return db.manyOrNone(sql);

};


User.findById=(id,callback)=>{
    const sql=`
    SELECT
        id,
        email,
        name,
        lastname,
        image,
        phone,
        password,
        session_token

    FROM users WHERE id=$1`;

    return db.oneOrNone(sql,id).then(user=>{callback(null,user);});

};

User.findByEmail=(email)=>{

    const sql=`
    SELECT
    u.id,
    u.email,
    u.name,
    lastname,
    u.image,
    u.phone,
    u.password,
    u.session_token,
    json_agg(
        json_build_object(
            'id',r.id,
            'name',r.name,
            'image',r.image,
            'route',r.route
        )
    ) AS roles

FROM users as u 
INNER JOIN 
    user_has_roles AS uhr
ON
    u.id=uhr.id_user
INNER JOIN
    roles AS r
ON
    uhr.id_rol=r.id
WHERE u.email= $1
GROUP BY u.id`;

    return db.oneOrNone(sql,email);

};


User.create = (user)=>{

    const myPassHashed =
    crypto.createHash('md5').update(user.password).digest('hex');
    user.password=myPassHashed;


    const sql=`

    INSERT INTO
        users
        (
           email,
           password,
           name,
           lastname,
           phone,
           image,
           created_at,
           updated_at
        )

    VALUES($1,$2,$3,$4,$5,$6,$7,$8) RETURNING id

    `;

    return db.oneOrNone(sql,[

        user.email,
        user.password,
        user.name,
        user.lastname,
        user.phone,
        user.image,
        new Date(),
        new Date()
    ]);
};

User.isPasswordMatched=(candidatePassword,hash)=>{
    const myPasswordHashed =crypto.createHash('md5').update(candidatePassword).digest('hex');
    if(myPasswordHashed===hash){
        return true;
    }
    return false;
};
module.exports=User;
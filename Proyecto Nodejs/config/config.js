const promise= require('bluebird');
const options ={
    promiseLib:promise,
    query: (e)=>{}
};

const pgp=require('pg-promise')(options);
const types =pgp.pg.types;
types.setTypeParser(1114,function(stringValue){
    return stringValue;
});

const databaseConfing={
    'host':'127.0.0.1',
    'port':5432,
    'database':'parcial_1_db',
    'user':'postgres',
    'password':'1234567890'
};

const db =pgp(databaseConfing);

module.exports=db;
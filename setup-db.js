// Script to setup database schema and seed data on Aiven
const mysql = require('mysql2/promise');
require('dotenv').config();
const fs = require('fs');
const path = require('path');

async function setupDatabase() {
    // Use IP address directly as workaround for DNS issues
    const host = '139.59.33.156'; // Resolved IP for mysql-e19aa30-carmatec-de8a.j.aivencloud.com

    const connection = await mysql.createConnection({
        host: host,
        user: process.env.DB_USER,
        password: process.env.DB_PASSWORD,
        database: process.env.DB_NAME,
        port: process.env.DB_PORT,
        ssl: { rejectUnauthorized: false },
        multipleStatements: true
    });

    console.log('✅ Connected to Aiven MySQL');

    // Read and run schema
    const schema = fs.readFileSync(path.join(__dirname, 'db/schema.sql'), 'utf8');
    await connection.query(schema);
    console.log('✅ Schema created');

    // Read and run seed
    const seed = fs.readFileSync(path.join(__dirname, 'db/seed.sql'), 'utf8');
    await connection.query(seed);
    console.log('✅ Seed data inserted');

    await connection.end();
    console.log('🎉 Database setup complete!');
}

setupDatabase().catch(err => {
    console.error('❌ Setup failed:', err.message);
    process.exit(1);
});

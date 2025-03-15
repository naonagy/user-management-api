***User Management App***

**Overview**

This is a basic user management app built with Laravel. It lets you easily manage users with simple CRUD operations and includes login/logout features for both admins and regular users.

***Login Credentials***

- **Admin User:**  
  - Email: `admin@example.com`  
  - Password: `adminpassword`
  
- **Normal User:**  
  - Email: `user@example.com`  
  - Password: `userpassword`



**Installation**

*1. Clone the Repository*
First, clone the repository to your local machine:

git clone https://github.com/naonagy/user-management-api.git


*2. Install Dependencies*

Navigate to the project directory and install the PHP and frontend dependencies.

*For PHP dependencies:*
cd your-project-name
composer install


If you're using Angular or jQuery for the frontend, run:
npm install


*3. Configure the .env File*

Copy the .env.example file to .env:
cp .env.example .env

Then, open the .env file and configure your database connection details.

*For MySQL:*

DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=your_db_name
DB_USERNAME=your_db_username
DB_PASSWORD=your_db_password

*If you're using MongoDB:*

DB_CONNECTION=mongodb
DB_HOST=127.0.0.1
DB_PORT=27017
DB_DATABASE=your_db_name

*4. Generate the Application Key*
Run the following command to generate the application key:

php artisan key:generate


*5. Set Up the Database*

Create the Database:
Create the database in your MySQL or MongoDB server.

Run Migrations:
For MySQL, run:
php artisan migrate

This will create the necessary tables in your database.

*Optional:* Using a Backup SQL File
If you prefer, you can use the *pre-configured database* backup:

Download the SQL file from the repository.
Import it using a MySQL client (e.g., HeidiSQL).
Make sure your .env file reflects the correct database configuration.

*6. Run the Development Server*
Finally, run the Laravel development server with:
php artisan serve

Your app should now be accessible at http://127.0.0.1:8000.
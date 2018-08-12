# Creating Dev, QA & Prod databases.

CREATE schema easybanking_security_dev; -- dev database for security module
CREATE schema easybanking_security_qa; -- qa database for security module
CREATE schema easybanking_security_prod; -- prod database for security module

# Creating Users.

CREATE USER eb_dev_user IDENTIFIED BY 'eb_dev_user';
CREATE USER eb_qa_user IDENTIFIED BY 'eb_qa_user';
CREATE USER eb_prod_user IDENTIFIED BY 'eb_prod_user';

# Creating Roles.

CREATE ROLE eb_dev_role, eb_qa_role, eb_prod_role;

# Granting Roles.

GRANT ALL ON easybanking_security_dev.* TO eb_dev_role;
GRANT ALL ON easybanking_security_qa.* TO eb_qa_role;
GRANT ALL ON easybanking_security_prod.* TO eb_prod_role;

# Assign Roles To Users.

GRANT eb_dev_role TO eb_dev_user;
GRANT eb_qa_role TO eb_qa_user;
GRANT eb_prod_role TO eb_prod_user;

SET DEFAULT ROLE ALL TO eb_dev_user;
SET DEFAULT ROLE ALL TO eb_qa_user;
SET DEFAULT ROLE ALL TO eb_prod_user;





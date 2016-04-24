### This is a full-blown J2EE application for family members

### To build this application you need to 
* Create an Amazon Simple DB
* Create domains on Amazon simpleDB described as below classes
   * com.family.db.domain.AddressDomain
   * com.family.db.domain.EventDomain
   * com.family.db.domain.FamilyDomain
   * com.family.db.domain.MoneyTransactionTypeDomain
   * com.family.db.domain.MoneyTransactionDomain
   * com.family.db.domain.UserDomain
   * dom.family.db.domain.WallMessageDomain
   
* Creating a family.properties with below Amazon SimpleDB's properties
   * sdbAccessKey=YOUR_AMAZON_SIMPLEDB_ACCES_KEY
   * sdbSecretKey=YOUR_AMAZON_SIMPLEDB_SECRET_KEY
   
* Modify pom.xml with the newly created family.properties

* Run "mvn clean install"



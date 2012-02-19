#-----
# JAVA
#-----
# JDK
export JAVA_HOME=/usr/java/default
export JAVA_PATH=$JAVA_HOME
export JDK_HOME=$JAVA_HOME
export PATH=$JAVA_HOME/bin:$PATH

# maven
export M2_HOME=/opt/maven/default
export PATH=$PATH:$M2_HOME/bin

# ant
export ANT_HOME=/opt/ant/default
export PATH=$PATH:$ANT_HOME/bin

# GWT
#export GWT_HOME=/opt/google/gwt-2.1.1
# grails
#export GRAILS_HOME=/usr/java/grails
#export PATH=$PATH:$GRAILS_HOME/bin

#------
# Scala
#------
export SCALA_HOME=/usr/scala/default
export PATH=$SCALA_HOME/bin:$PATH

#---
# DB
#---
# pg
export PGUSER=postgres
export PATH=$PATH:/opt/PostgreSQL/9.0/bin:/opt/PostgreSQL/pg_top/bin/
export LD_LIBRARY_PATH=/opt/PostgreSQL/9.0/lib:$LD_LIBRARY_PATH

# Oracle
#export TNS_ADMIN=/opt/sqldeveloper

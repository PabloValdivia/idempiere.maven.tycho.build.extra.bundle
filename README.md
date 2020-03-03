# idempiere.maven.tycho.build.extra.bundle

Groupt of core plugin to build extra plugin

# How to build extra plugin
1. clone your idempiere to [ROOT-HOME]/idempiere
2. prepare extra plugin
    1. clone repository (project.extra.bundle)[https://bitbucket.org/hasuvimex/project.extra.bundle] to [ROOT-HOME]/project.extra.bundle
    2. clone extra plugin to inside [ROOT-HOME]/project.extra.bundle, so we have [ROOT-HOME]/project.extra.bundle/plugin-1, [ROOT-HOME]/project.extra.bundle/plugin-2
	3. add maven tycho support to your Osgi plugin follow wiki (add tycho support)[http://wiki.idempiere.org/en/Building_iDempiere_by_tycho#Make_a_Osgi_plugin_become_maven_project]
	3. edit [ROOT-HOME]/project.extra.bundle/pom.xml to add your plugin to modules
3. clone this repository to [ROOT-HOME]/idempiere.maven.tycho.build.extra.bundle
4. edit [ROOT-HOME]/idempiere.maven.tycho.build.extra.bundle/pom.xml to include project.extra.bundle to modules
5. go to [ROOT-HOME]/idempiere and run "mvn verify", when it finish we have p2 repository contain all core idempiere and dependency at [ROOT-HOME]/idempiere/org.idempiere.p2/target/repository
6. each time do step 5 need to run [ROOT-HOME]/idempiere.maven.tycho.build.extra.bundle/update.version.sh. this script will update new version of plugin output from step 5 to [ROOT-HOME]/idempiere.maven.tycho.build.extra.bundle/org.idempiere.p2.build.extra.bundle.targetplatform/org.idempiere.p2.build.extra.bundle.targetplatform.target
7. go to [ROOT-HOME]/idempiere.maven.tycho.build.extra.bundle and run "mvn -f pom-jetty.xml jetty:run" to host [ROOT-HOME]/idempiere/org.idempiere.p2/target/repository to localhost:8080/idempiere-core
7. go to [ROOT-HOME]/idempiere.maven.tycho.build.extra.bundle and run [mvn verify -Didempiere.target="org.idempiere.p2.build.extra.bundle.targetplatform"] to build extra plugin. ouput will go to [ROOT-HOME]/idempiere.maven.tycho.build.extra.bundle/org.idempiere.p2.build.extra.bundle.site/target/repository

now we can use director application to install my feature all all plugin into product
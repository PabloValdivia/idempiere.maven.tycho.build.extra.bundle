# Build set of plugins/feature on https://github.com/hieplq/web.service.client.bnd/tree/master/co.globalqss.fedian-idempiere

## this build depend on
1. p2 repository generate at [idempiere]/org.idempiere.p2/target/repository when build idempiere 
<br/>i try to use from [ci iDempiere7.1Daily](https://jenkins.idempiere.org/job/iDempiere7.1Daily/ws/org.idempiere.p2/target/repository/) but it get issue when resolve target platform. maybe server on jenkins isn't full function
<br/>so i build by myself and commit to [my github](https://github.com/hieplq/idempiere.artifact/tree/idempiere-7.1.0.202002201435/m2p/idempiere-7.1.0.202002201435)
<br/> before build by yourself don't forget check on to sure ticket IDEMPIERE-4136 is merged to core or you need to apply to your local

2. p2 repository for all cxf and its dependency [org.idempiere.webservice.client](https://github.com/hieplq/idempiere.artifact/tree/cxf-3.3.1-service.client/m2p/org.idempiere.webservice.client)
<br/> it build by pom file on same location

3. install [idempiere]/org.idempiere.parent to maven local for get rid of relation path on plugins use it as parent
<br/> go to folder [idempiere]/org.idempiere.parent and run "mvn install"

## build extra plugins
```shell
export buildDir="~/buildExtraPlugin"
mkdir $buildDir
cd $buildDir

git clone git@github.com:hieplq/web.service.client.bnd.git
touch $buildDir/web.service.client.bnd/co.globalqss.fedian-idempiere/co.globalqss.fedian.client.api/Certificado.pfx
# touch Certificado.pfx just for test build. you need to copy your real file

git clone git@github.com:hieplq/idempiere.maven.tycho.build.extra.bundle.git
cd idempiere.maven.tycho.build.extra.bundle/
git checkout cxf-webclient

mvn verify -X -e -Didempiere.target=org.idempiere.p2.build.extra.bundle.targetplatform
cd $buildDir/idempiere.maven.tycho.build.extra.bundle/org.idempiere.p2.build.extra.bundle.site/target/repository
```
if every command success, you get a p2 repository at $buildDir/idempiere.maven.tycho.build.extra.bundle/org.idempiere.p2.build.extra.bundle.site/target/repository
<br/> you can use this repository to install this feature with all its dependency

## install co.globalqss.fedian.client.feature
1. upload $buildDir/idempiere.maven.tycho.build.extra.bundle/org.idempiere.p2.build.extra.bundle.site/target/repository to your web server (you can use file protocal also)
2. go to idempiere server. go to idempiere binary folder
3. run install command
```shell
./update-prd.sh "$buildDir/idempiere.maven.tycho.build.extra.bundle/org.idempiere.p2.build.extra.bundle.site/target/repository" co.globalqss.fedian.client.feature.feature.group
```

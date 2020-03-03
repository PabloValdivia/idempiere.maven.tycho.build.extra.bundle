#!/bin/sh
SCRIPT_FOLDER=$(readlink -f $0)
SCRIPT_FOLDER=$(dirname $SCRIPT_FOLDER)

p2Folder=${1:-${SCRIPT_FOLDER}/../idempiere/org.idempiere.p2/target/repository/plugins}
fileVersion=${2:-"org.adempiere.base_*.jar"}
targetFile=${SCRIPT_FOLDER}/org.idempiere.p2.build.extra.bundle.targetplatform/org.idempiere.p2.build.extra.bundle.targetplatform.target

fullname=`find ${p2Folder} -name ${fileVersion}`
version=$(echo $fullname | sed -r "s|.*_([^_/]*)\.jar|\1|g")
sed -ri "s|version=\"5.1.0..*\"/>|version=\"$version\"/>|g" ${targetFile}

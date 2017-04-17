#! /bin/bash
alias jdk7='JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64'
alias ion_put=/home/jfaust/bin/ion_put.sh
# created /etc/systemd/system/etherpad.service
# then started systemctl start etherpad

# curl 'https://emsqa-reservations/reservations/reserve/planck/' -H 'Cookie: sessionid=6yddmd997xmobcgldvnsoz9l6ap84v9l; csrftoken=UrJ3VzG4AwOAQHpksU60zHfTyJ7Lz0zC' -H 'Origin: https://emsqa-reservations' -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language: en-US,en;q=0.8' -H 'Upgrade-Insecure-Requests: 1' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36' -H 'Content-Type: application/x-www-form-urlencoded' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Cache-Control: max-age=0' -H 'Referer: https://emsqa-reservations/reservations/reserve/planck/' -H 'Connection: keep-alive' --data 'csrfmiddlewaretoken=UrJ3VzG4AwOAQHpksU60zHfTyJ7Lz0zC&form-TOTAL_FORMS=1&form-INITIAL_FORMS=1&form-MIN_NUM_FORMS=0&form-MAX_NUM_FORMS=1&form-0-host=planck&form-0-reserved_by=7&form-0-start=2017-01-19+12%3A28%3A23&initial-form-0-start=2017-01-19+12%3A28%3A23.852231&form-0-duration=01%3A00%3A00&form-0-notes=asfd' --compressed --insecure
# rsstail -n 100 -u 'https://egghead.io/lessons/pro_feed?user_email=activedecay%40gmail.com&user_token=a8d22079-920a-4700-8857-fd22544b6daf'
#ion_run bellatrix <(paste /hg/0angle/reset-ion-to-install -s -d\;); ion_run betelgeuse <(paste /hg/0angle/reset-ion-to-install -s -d\;)
# idea $(t=$(mktemp); cat >$t <(doit); echo $t)
#regen () { # regenerate ion (smf/fikon) certs
#    /opt/sandisk/jmxms/usr/sbin/smf-first-boot.sh
#    service smf restart
#    /opt/sandisk/ioncli/usr/sbin/ioncli-first-boot.sh
#}
alias iondev-ini="sshpass -p Fusion123 ssh root@10.60.62.114" # initiator machine; need to rescan this after ION reinstall
alias wallpaper='feh --bg-max --no-xinerama "$@"'
function jira() {
    google-chrome --new-window $(for J in $*
            do echo https://essjira.sandisk.com/browse/${J}
        done) >/dev/null
}
alias jq-all-the-things='for x in * ; do echo $x $(jqe t $x |sort|uniq); done'
alias jq-all-the-versions='for x in * ; do echo $(jq ".objects[]|[.version,.build_number]" <(jqe soft $x)) $x; done | sort'
function jqe () { # jq export from smf
    if [ $1 == "nodes" ]; then object="SaftNode"; fi
    if [ $1 == "soft" ]; then object="SaftSoftware"; fi
    if [ $1 == "hp" ]; then object="SaftHostPort"; fi
    if [ $1 == "t" ]; then
        command=".providerObjectGroups[]|.objectType.ObjectType";
    else
        command=".providerObjectGroups[]| if .objectType.ObjectType == \"${object}\" then . else empty end"
    fi
    jq "${command}" $2
}

function jqs () { ## jq saft
    if [ ! "$1" ]; then
        echo "bd" "br" "bus" "can" "ch" "cl" "cna" "cpu" "dev" "d" "e" "f" "h" "hg" "hp" "l" "n" \
            "numa" "prf" "late" "pool" "pp" "port" "psu" "qdisk" "r" "s" "t10" "t" "temp" "tc" "tz" "v";
        return
    fi
    if [ "$1" == "bd" ]; then key="vsl_saft/boot/drive?detail=true"; fi
    if [ "$1" == "br" ]; then key="vsl_saft/boot/raid?detail=true"; fi
    if [ "$1" == "bus" ]; then key="vsl_saft/bus?detail=true"; fi
    if [ "$1" == "can" ]; then key="vsl_saft/canister?detail=true"; fi
    if [ "$1" == "ch" ]; then key="vsl_saft/chassis?detail=true"; fi
    if [ "$1" == "cl" ]; then key="vsl_saft/cluster?detail=true"; fi
    if [ "$1" == "cna" ]; then key="vsl_saft/cna?detail=true"; fi
    if [ "$1" == "cpu" ]; then key="vsl_saft/cpu?detail=true"; fi
    if [ "$1" == "dev" ]; then key="vsl_saft/device?detail=true"; fi
    if [ "$1" == "d" ]; then key="vsl_saft/drive?detail=true"; fi
    if [ "$1" == "e" ]; then key="vsl_saft/enclosure?detail=true"; fi
    if [ "$1" == "f" ]; then key="vsl_saft/fan?detail=true"; fi
    if [ "$1" == "h" ]; then key="vsl_saft/host?detail=true"; fi
    if [ "$1" == "hg" ]; then key="vsl_saft/host_group?detail=true"; fi
    if [ "$1" == "hp" ]; then key="vsl_saft/host_port?detail=true"; fi
    if [ "$1" == "l" ]; then key="vsl_saft/lun?detail=true"; fi
    if [ "$1" == "n" ]; then key="vsl_saft/node?detail=true"; fi
    if [ "$1" == "numa" ]; then key="vsl_saft/numanode?detail=true"; fi
    if [ "$1" == "prf" ]; then key="vsl_saft/perfstat?detail=true"; fi
    if [ "$1" == "late" ]; then key="vsl_saft/perfstat_latency?detail=true"; fi
    if [ "$1" == "pool" ]; then key="vsl_saft/pool?detail=true"; fi
    if [ "$1" == "pp" ]; then key="vsl_saft/pool_profile?detail=true"; fi
    if [ "$1" == "port" ]; then key="vsl_saft/port?detail=true"; fi
    if [ "$1" == "psu" ]; then key="vsl_saft/psu?detail=true"; fi
    if [ "$1" == "qdisk" ]; then key="vsl_saft/qdisk?detail=true"; fi
    if [ "$1" == "r" ]; then key="vsl_saft/raid?detail=true"; fi
    if [ "$1" == "s" ]; then key="vsl_saft/software?detail=true"; fi
    if [ "$1" == "t10" ]; then key="vsl_saft/t10pi?detail=true"; fi
    if [ "$1" == "t" ]; then key="vsl_saft/target?detail=true"; fi
    if [ "$1" == "temp" ]; then key="vsl_saft/temp_sensor?detail=true"; fi
    if [ "$1" == "tc" ]; then key="vsl_saft/timeconfig?detail=true"; fi
    if [ "$1" == "tz" ]; then key="vsl_saft/timezone?detail=true"; fi
    if [ "$1" == "v" ]; then key="vsl_saft/volume?detail=true"; fi

    jq ".[\"${key}\"]" $2
}
function ion-make-demo() {
    settings=$(echo '"BUILD_DEMO=TRUE;BUILD_ENABLE_RD=0;BUILD_SIZE_RD=4000;BUILD_NUM_RD=6"' | tr ';' '\n')
    ion_run $1 <(echo "cat >> /etc/default/ion <<<$settings")
    ion_run $1 <(echo "reboot")
}
alias wmd='curl -kujfaust:Boiaser5 "https://essjira.sandisk.com/activity?maxResults=100&streams=user+IS+jfaust&streams=update-date+AFTER+$(( $(date +%s) - 53963134 ))999&os_authType=basic&title=undefined"'
function gen-saft(){
  run1='com.sandisk.jmxsrv.codegen.CodeGenerator providers/saft/src/main/models providers/saft/target/generated-resources/codegen providers/base/src/main/resource-templates'
  run2='com.sandisk.jmxsrv.codegen.CodeGenerator providers/base/src/main/models providers/base/target/generated-resources/codegen providers/base/src/main/resource-templates'
  run3='com.sandisk.jmxsrv.codegen.CodeGenerator providers/saft/src/main/models providers/saft/target/generated-sources/codegen providers/base/src/main/templates'
  jars='/home/jfaust/.m2/repository/commons-collections/commons-collections/3.2.1/commons-collections-3.2.1.jar
/home/jfaust/.m2/repository/commons-lang/commons-lang/2.4/commons-lang-2.4.jar
/home/jfaust/.m2/repository/com/google/guava/guava/18.0/guava-18.0.jar
/home/jfaust/.m2/repository/org/jvnet/jaxb2_commons/jaxb2-basics-runtime/0.8.2/jaxb2-basics-runtime-0.8.2.jar
/home/jfaust/.m2/repository/io/dropwizard/dropwizard-util/0.8.5/dropwizard-util-0.8.5.jar
/home/jfaust/.m2/repository/com/fasterxml/jackson/core/jackson-annotations/2.5.0/jackson-annotations-2.5.0.jar
/home/jfaust/.m2/repository/joda-time/joda-time/2.7/joda-time-2.7.jar
/home/jfaust/.m2/repository/org/apache/velocity/velocity/1.7/velocity-1.7.jar
/home/jfaust/.m2/repository/com/google/guava/guava/18.0/guava-18.0.jar
/home/jfaust/.m2/repository/log4j/log4j/1.2.17/log4j-1.2.17.jar
codegen/target/fio-jmx-codegen-1.1-SNAPSHOT.jar'
  classpath=$(echo "${jars}"|paste -d':' -s)
  java -cp ${classpath} ${run1}
  java -cp ${classpath} ${run2}
  java -cp ${classpath} ${run3}
  cp /hg/m/s/providers/saft/target/generated-resources/codegen/CommandMessagessaft.properties ./providers/saft/target/classes
  cp /hg/m/s/providers/base/target/generated-resources/codegen/CommandMessagescommon.properties ./providers/base/target/classes
}
function saft-snapshot(){
  utils=/hg/m/s/utils
  machine=$1
  password="admin:admin"
  if [ $2 ]; then password=$2; fi

  snapshot=$( { ${utils}/ion/ion_run.sh ${machine} python ${utils}/saft-snapshot/saft-snapshot.py; } 2>&1 )
  echo "${snapshot}" | tail -n 1 | python -mjson.tool > saftsnapshot.json
}
function provision-installion(){
  install liblzma-dev virtualenv
  virtualenv gargamel
  . gargamel/bin/activate
  pip install lxml paramiko PyYAML passlib selenium pytest pywinrm pysmb PyHamcrest backports.lzma
}
function ion-provision(){ # ion-profision host <implied w/ gilligan classic>
  host=$1
  python scripts/provision.py --hosts $host --os ion-gilligan-classic &
  tailf /management_QA/jay/LATEST/DebugLogs/Master.log
}
function clone-ion-repo(){ # clone-ion-repo <emsgit.sandisk.com-repourl> <folder>
  GIT_SSL_NO_VERIFY=true git clone $1
  cd $2
  git config http.sslVerify "false"
}
function ivr(){
  curl -kuadmin:fusionio https://$1/api/version
}
alias smfcp='goodsmfjars|xargs realpath|paste -s -d":"'
alias goodsmfjars='find /hg/m/s -name *jar|grep -v -e config -e dbquery -e fio-jmx-plugins -e tests -e original| grep -e shade -e plugins'
alias cronshit='crontab -e' # can use sudo for root's
function killfts(){ # usage: killfts hostname:port admin:password
  hostport='localhost:18443'
  password='admin:admin'
  if [ $1 ]; then hostport=$1; fi
  if [ $2 ]; then password=$2; fi
  echo 'kill first time setup; using' $hostport $password
  curl -k -u $password -H "Content-Type: application/json" \
     -X POST -d '{"eulaAccepted": true, "initialSetupComplete": true}' \
     https://$hostport/api/ion/gui/setup
}
alias xmind=XMind
function jt(){
    USER=jfaust PASSWORD=Boiaser5 /hg/it/smf/getJiraTars.sh $1;
    tarxf
    if [ $(ls -1 ion*-dir | wc -l) == 1 ];
        then mv ion*-dir/* $1;
        else
            i=1
            for x in ion*-dir; do
                mv ${x}/* $1-${i}
                for y in $(find $1-${i} -name hostname|grep system); do mv $(dirname $(dirname $y)) $1-$(cat $y); done
                i=$(( ${i} + 1 ))
            done
    fi
    rm ion*-dir -r; rm ion*.tar.* -r
}
# management clients builds
alias gf='glueface'
function glueface() {
    args=$1
    if [ $1 == "b" ];
        then args="build --dev";
    elif [ $1 == "r" ];
        then args="rpm-build --dev --pkg=ion";
    elif [ $1 == "s" ];
        then args="serve";
    elif [ $1 == "k" ];
        then args="karma";
    fi
    basedir=$(realpath $(if [ -d ion ]; then echo ion; else echo .; fi))
    pushd ${basedir} 2>&1 >/dev/null
    gulp ${args}
    popd 2>&1 >/dev/null
}
# management service builds
alias luda='./build.py ludicrous-speed && echo && echo "the shade jar was not built! however, SUCCESS!"'
alias lsp='lsof -i -n -P | grep LISTEN'
alias itl='ion-tail-log'
alias itfs='ion-tail-fio-saft'
function ion-tail-log() {
    ion_run $1 <(echo 'tailf /var/log/sandisk/jmxms/fio-jmx-srv.log')
}
function ion-tail-fio-saft() {
    ion_run $1 <(echo 'tailf /var/log/fio-saft')
}
alias ie='ion-execute'
function ion-execute() {
    ion_run $1 <(echo $2)
}
function ioncli() { # open local fikon/ioncli <hostname>; you must be running SMF locally at :9053
    pushd /hg/m/s/utils/ion/v-wing/sim-fikon 2>&1>/dev/null
    mvnDebug -f /home/jfaust/fikon/fikon-distribution/pom.xml \
                exec:java \
                -Dsimulator=admin,admin \
                -Duser.name=admin \
                -Dexec.mainClass=com.fusionio.fikon.Fikon \
                -Dioncli.config.path=/hg/m/s/utils/ion/v-wing/sim-fikon/fikon.yml \
                -DFIKON_SAFT=http://$1:5000 \
                -Dexec.args="--smf-url https://jay:9053 --saft-url http://$1:5000"
    popd
}
function fikon() { # usage: fikon planck nodes
    ssh_args="-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
    hostname="$1"
    sshpass -p "admin" ssh admin@${hostname} ${ssh_args} < <(echo $2)
}
function ion-firewall() {
  ion_run $1 <(echo SuSEfirewall2 off)
}
function mkclassic(){
 ion_run $1 <(classic)
}
function classic () {
  # settings=$(echo '"BUILD_DEMO=TRUE;BUILD_ENABLE_RD=0;BUILD_SIZE_RD=4000;BUILD_NUM_RD=6"' | tr ';' '\n')
  echo "
  sed -i 's/BUILD_SHARED_STORAGE=TRUE/BUILD_SHARED_STORAGE=FALSE/' /usr/share/ion/release
  sed -i 's/ - type: infiniflash/# infiniflash provider removed/' /opt/sandisk/jmxms/etc/smf_config.yml
  rm -f /etc/init.d/fio-agent /etc/init.d/fio-msrv
  reboot
  "
}
alias dsl='bm dsl-codegen'
E2E_ENVIRONMENT="JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64 E2E_URL=https://localhost:18443 CHROME_BIN=`which google-chrome` SCREENSHOT_HEIGHT=1204"
alias e2e="${E2E_ENVIRONMENT} npm run e2e:screenshot"
alias e2e-mode="${E2E_ENVIRONMENT} npm run e2e:mode"
alias e2e-spec="${E2E_ENVIRONMENT} npm run e2e:specs -- --specs"
alias cap='if [ -d ./ion ] ; then pushd ion 2>&1 >/dev/null; fi; e2e; npm run diffs;'
alias decap='killfts && dfb && e2e && npm run diffs && feh e2e/diffs/*'
function explore(){
  port='18443'
  scheme='https'
  if [ $1 ]; then port="$1"; fi
  if [ $2 ]; then scheme="$2"; fi
  E2E_URL=https://localhost:18443 CHROME_BIN=`which google-chrome` npm run e2e:explore
}
alias g='grep'
alias gi='grep -i'
alias gr='grep -r'
alias ajf='attach-jira-file'
function attach-jira-file(){
  curl -s -D- -ujfaust -X POST -H "X-Atlassian-Token: nocheck" -F "file=@$2" -k https://essjira.sandisk.com/rest/api/2/issue/$1/attachments
}
alias jks='jira-key-summary'
function jira-key-summary(){ # find a jira key, and formats a string using <key>: <summary>
  /home/jfaust/bin/api.sh $1|jq -r .key,.fields.summary | paste -s -d: | sed 's/:/: /'
}
function superworkdir(){
  rm resources/html/iomanager
  ln -s $(realpath com.fusionio.fwm.IoManagerDev/compile-$1/war/iomanager) resources/html/iomanager
  ls -l resources/html/iomanager
}
alias revert='echo "pkill java ; echo ; cp -fpv /origin/opt/sandisk/ioncli/usr/share/java/fikon-shade-*.jar /opt/sandisk/ioncli/usr/share/java/ ; cp -fpv /origin/opt/sandisk/ioncli/etc/defaultFormats.xml /opt/sandisk/ioncli/etc/defaultFormats.xml ; cp -fpv /origin/opt/sandisk/jmxms/usr/share/java/fio-jmx-shade-*.jar /opt/sandisk/jmxms/usr/share/java/ ; echo > /home/admin/.fikon/fikon.log ; echo > /root/.fikon/fikon.log ; find /opt/fio-saft -name *.pyc -exec rm -f {} \; ; cp -fpv /origin/opt/fio-saft/*.py /opt/fio-saft/ ; echo ; ls -alrt /opt/fio-saft ; echo ; find / -name "*shade*.jar" -exec ls -alrt {} \; ; echo ; service fio-saft restart ; service smf restart"'
alias whitespaces='fold -w 80 -s'

alias gencaches='apt-cache gencaches'
alias showpkg='apt-cache showpkg'
alias showsrc='apt-cache showsrc'
alias stats='apt-cache stats'
alias dump='apt-cache dump'
alias dumpavail='apt-cache dumpavail'
alias unmet='apt-cache unmet'
alias search='apt-cache search'
alias show='apt-cache show'
alias depends='apt-cache depends'
alias rdepends='apt-cache rdepends'
alias pkgnames='apt-cache pkgnames'
alias dotty='apt-cache dotty'
alias xvcg='apt-cache xvcg'
alias policy='apt-cache policy'
alias update='sudo apt-get update'
alias upgrade='sudo apt-get upgrade'
alias install='sudo apt-get install'
alias remove='sudo apt-get remove'
alias autoremove='sudo apt-get autoremove'
alias purge='sudo apt-get purge'
alias source='sudo apt-get source'
alias build-dep='sudo apt-get build-dep'
alias dist-upgrade='sudo apt-get dist-upgrade'
alias dselect-upgrade='sudo apt-get dselect-upgrade'
alias clean='sudo apt-get clean'
alias autoclean='sudo apt-get autoclean'
alias check='sudo apt-get check'
alias changelog='sudo apt-get changelog'
alias download='sudo apt-get download'

alias ka='bm quick-test'
function xtouch() { touch $1; chmod +x $1; }
function suxtouch() { sudo touch $1; sudo chmod +x $1; }
alias sim-qa='sshpass -pcentcio ssh root@mgmt-jmx-sles113-1'
alias startup='sensible-editor ~/.fluxbox/startup'
alias demo-integrate='ion-integration 10.50.141.152 10.50.141.154'
alias demo-jv='./ion_jvisualvm 10.50.141.152 10.50.141.154'
alias dion='do-ion-install'
alias dior='do-ion-install-rpm'
alias dioj='do-ion-install-jar'
function do-ion-install() { ion_run $1 <(echo $(ion-integrate-installation)) ; }
function do-ion-install-rpm() { ion_run $1 <(ion-execute-rpm) ; }
function do-ion-install-jar() { ion_run $1 <(ion-execute-jar) ; }
alias ion-execute-rpm="echo 'rpm -e ion-client; rpm -i ion-client*.noarch.rpm'"
alias ion-execute-jar="echo 'mv fio-jmx-shade-*T.jar /opt/sandisk/jmxms/usr/share/java/; systemctl restart smf;'"
alias ion-integrate-installation="echo 'rpm -e ion-client; rpm -i ion-client*.noarch.rpm; mv fio-jmx-shade-*T.jar /opt/sandisk/jmxms/usr/share/java/; systemctl restart smf;'"
alias ice='ion-copy-smf-files'
function ion-copy-smf-files() {
  for artifact in clients/ion/rpm/RPMS/noarch/ion-client*.noarch.rpm \
                  service/shade/target/fio-jmx-shade*T.jar;
  do
    for node in "$@"
    do
        ion_put $artifact $node;
    done
  done
}
alias smf='./utils/jmxquery/src/python/smf.py'
alias nd='/home/jfaust/hack/javascript/deps.js -f'

function prox() { ./build.py -p localhost:$1; }
function ion-info(){
  pushd /home/jfaust/hack/jenkins
  /home/jfaust/hack/jenkins/derp.sh $*
  popd
}
alias sshjlee='sshpass -pcentcio ssh root@jlee-sles113-1'
alias doreviewinc='curl http://atlatl:8124/reviewers/user/jfaust/inc'
alias sshatlatl='sshpass -p fusionio ssh emd@atlatl -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
function docmbean(){ # whatever SMF is running on 1099 will have every activity created, so that later you can document it; $1==curl then curl $2 contains app and/or act $3 anystring means $4 filters which operations to do
  if [ "curl" == "$1" ]; then python /hg/mgmt-qa/automation/gargamel/document-mbean.py; fi
  pushd $(realpath $(dirname /hg/s/hack/api/script.sh)) >/dev/null
  ./script.sh $1 $2 # re-ups the final doc
  popd>/dev/null
  if [ "" != "$3" ]; then opermbean "$4"; fi
}
function opermbean(){ # $1 says which operation to perform (string contains filter)
  pushd /hg/s/hack >/dev/null
  python ./operations.py "$1"
  popd>/dev/null
}
function exportsmf(){
  scheme="https"
  hostport=$1
  if [ $2 ]; then
    hostport="$2"
    scheme="$1"
  fi
  curl -kuadmin:admin ${scheme}://${hostport}/api/data/export
}
function refreshsmf(){
  curl -k -XPOST "http$3://$1:$2/tasks/refresh"
}
alias dfb='defib jay 18444'
function defib(){
  curl -v -k -XPOST https://$1:$2/tasks/defibrillate
}
alias ish="ion_ssh"
function ports() {
  netstat -ntlp
}
function ntpdate-android() {
sudo ntpdate 2.android.pool.ntp.org
}
function crazy() {
foo="$*"
for (( i=0; i<${#foo}; i++ )); do
if [ $(($i % 2)) == 0 ]; then
  echo -n "${foo:$i:1}" | tr '[:lower:]' '[:upper:]'
else
  echo -n "${foo:$i:1}"
fi
done
echo
}
alias jmc="/usr/lib/jvm/jdk1.7.0_75/bin/jmc"
alias hours_until='echo -n $(( $(( $(($(date -d "$until" +%s) - $(date +%s))) / 60 )) / 60 ))'
function time_until(){
  then=$(date -d "$until" +%s)
  now=$(date +%s)
  diff=$(wcalc -q $then-$now)
  echo -n 'Hours..... '
  echo -n 'Minutes... '
  echo    'Seconds... '
  echo $(wcalc -q $diff/60/60) $(wcalc -q $diff/60%60) $(wcalc -q $diff%60)
}

alias psj='psjava|while read line; do cut -f1-2 -d" " <(echo $line); for arg in $(cut -f3- -d" " <(echo $line)); do echo "  $arg"; done|sort; done'
alias psjava='pgrep java|xargs -I% ps --noheader u --pid %'
alias psjava='jps -vm'
#java -cp fio-jmx-shade-1.0-SNAPSHOT.jar org.h2.tools.Shell -url "jdbc:h2:~/fio-jmx-srv" -user admin
alias h2='java -jar /home/jfaust/.m2/repository/com/h2database/h2/1.3.176/h2-1.3.176.jar'
function adddays() { # adds <days> to current date
  date "--date=+$1 days"
}

function colors() {
 for i in $(seq 1 7); do
  echo " $(tput setaf $i)Text$(tput sgr0) $(tput bold)$(tput setaf $i)Text$(tput sgr0) $(tput sgr 0 1)$(tput setaf $i)Text$(tput sgr0)  \$(tput setaf $i)"
 done

 echo ' Bold            $(tput bold)'
 echo ' Underline       $(tput sgr 0 1)'
 echo ' Reset           $(tput sgr0)'
}
function urlescape() {
  echo $* | sed -f /home/jfaust/bin/url_escape.sed
}
function tl(){
  tree -L $1
}
function activity(){
# ?maxResults=10&streams=user+IS+jfaust&streams=update-date+AFTER+1426571999999&os_authType=basic&title=undefined
  #echo "https://jira.int.fusionio.com/activity?maxResults=10&streams=user+IS+jfaust&streams=update-date+AFTER+$(date -dlast-monday +%s)0000&os_authType=basic&title=undefined"
  curl -s -H "Authorization: Basic amZhdXN0OlVvaWFzZXI1" "https://jira.int.fusionio.com/activity?maxResults=10&streams=user+IS+jfaust&streams=update-date+AFTER+$(date -dlast-monday +%s)000&os_authType=basic&title=undefined"
}

function rpm_halpr() {
  case "$1" in
    -i|--install) shift; rpm -ivh $1 ;;
    -U|--upgrade) shift; rpm -Uvh $1 ;;
    -l|--list) shift; rpm -qlp $1 ;;
    -I|--info) shift; rpm -qpi $1 ;;
  esac
#rpm -ivh {rpm-file}        #Install the package                                                             rpm -ivh mozilla-mail-1.7.5-17.i586.rpm
#rpm -Uvh {rpm-file}        #Upgrade package                                                                 rpm -Uvh mozilla-mail-1.7.6-12.i586.rpm
#rpm -ev {package}          #Erase/remove/ an installed package                                              rpm -ev mozilla-mail
#rpm -ev --nodeps {package} #Erase/remove/ an installed package without checking for dependencies            rpm -ev --nodeps mozilla-mail
#rpm -qa                    #Display list all installed packages                                             rpm -qa
#rpm -qi {package}          #Display installed information along with package version and short description  rpm -qi mozilla-mail
#rpm -qf {/path/to/file}    #Find out what package a file belongs to i.e. find what package owns the file    rpm -qf /etc/passwd
#rpm -qc {pacakge-name}     #Display list of configuration file(s) for a package                             rpm -qc httpd
#rpm -qcf {/path/to/file}   #Display list of configuration files for a command                               rpm -qcf /usr/X11R6/bin/xeyes
#rpm -qa --last             #Display list of all recently installed RPMs                                     rpm -qa --last
#rpm -qpR {.rpm-file}       #Find out what dependencies a rpm file has                                       rpm -qpR mediawiki-1.4rc1-4.i586.rpm
#rpm -qR {package}          #Find out what dependencies a rpm file has                                       rpm -qR bash

#rpm -e package-1.2.3-gm	Erase named package from system
#rpm -i package-1.2.3-gm.rpm	Install package file into system
#rpm -U package-1.2.3-gm	Upgrade package
#rpm -F package1 package2	Upgrade packages to latest versions in an appropriate order
#rpm -Fvh *			Upgrade a bunch of packages from the matching RPM files
#rpm -q package			Returns full name and version of installed package
#rpm -qp package.rpm		Same for a non-installed package
#rpm -qi package		Returns misc details about package
#rpm -qpi package.rpm		Same for a non-installed package
#rpm -qa | grep something	Search all installed packages for something
#rpm -qf file			Which package put this file here?
#rpm -ql package		List of files in an installed package
#rpm -qlp package.rpm		Same for files in a non-installed package
#rpm -qRl package		List dependencies of an installed package
#rpm -qR package.rpm		List dependencies of a non-installed package
#rpm -ivh package.src.rpm	Install a source RPM, spec goes into /usr/src/RedHat/SPECS
#rpmbuild -ba package.spec	Build from installed source installed
#rpm -qa --queryformat="%10{SIZE}t%{NAME}n" | sort -k1,1n	List installed software packages in order of size

}

alias keys='kt ~/.fluxbox/keys'
function dpkg-halpr(){
  if $2; then
    # extract
    dpkg --fsys-tarfile fio-agent_3.14.0.40-1.0_amd64.deb |tar xf - './etc/init.d/fio-agent' -C .
  elif $1; then
    # list
    # dpkg-deb -c whatever.deb #contents
    dpkg --fsys-tarfile fio-agent_3.14.0.40-1.0_amd64.deb |tar tf -
  else
    # info
    dpkg --info
  fi
}
alias bst='hg id; build_status'
function build_status(){ # wow this is hard.
  curl -s $1/api/json|jq '{"hash":.actions[0].parameters[0].value,"repo":.actions[0].parameters[1].value, result}'
#  curl -s $1/api/json|jq '{"hash":.actions[3].mercurialNodeName,"repo":.actions[0].parameters[1].value, result}'
}
alias pys='pull_yer_smoke' # hg pull -r hash repo MUST USE SMOKE FROM INDIVIDUAL MACHIEN todo FIX THAT
function pull_yer_smoke(){ # hg pull -r hash repo
    $(build_status $1| jq -r '@sh "hg pull -r \(.hash) \(.repo)"' | tr -d "'" )
}
alias bhi='build_hg_info'
function build_hg_info(){
  x=$(curl -s $1/api/json|jq '{
    "hash":.actions[0].parameters[0].value,
    "repo":.actions[0].parameters[1].value,
  }')
  hg pull -r$(jq -rc '.hash' <<<${x}) $(jq -rc '.repo' <<<${x})
}
function monitorsmoke() {
  i=0
  progress='←↖↑↗→↘↓↙▁▂▃▄▅▆▇█▇▆▅▄▃▁⣾⣽⣻⢿⡿⣟⣯⣷⠁⠂⠄⡀⢀⠠⠐⠈'
  while ! $(bst $1|jq '.result=="SUCCESS"'); do
    if $(bst $1|jq '.result=="FAILURE"'); then echo "Build FAILED! :("; return; fi
    lol=${#progress}
    while [ $lol -gt 0 ]; do
      idx=$(expr $i % ${#progress})
      echo -ne " ${progress:$idx:1} " " ${progress:$idx:1} " " ${progress:$idx:1} " '\r'
      i=$(expr $i + 1)
      python -c import\ time\;time.sleep\(.1\)
      lol=$(expr $lol - 1)
    done
  done
  echo "Build Success!!! <3"
}
alias font-list=fc-list
function mountandroid(){
  if [ $1 ]; then
    fusermount -u /media/nexus6
  else
    mtpfs -o allow_other /media/nexus6
  fi
}
function mountusb(){
  sudo mount -t vfat /dev/sdc1 /media/usb-external -o uid=1000,gid=1000,utf8,dmask=027,fmask=137
}
function bmh(){
  ./build.py -h |sed "s/.*\(\[.*\)/\\1/"|head -n1|tr \' ' '|tr '[' ' '| tr ',' ' ' |tr ']' ' '
}
function gkwho(){
  while true; do m=$(hg pull --update -R/hg/gkers -q; /hg/gkers/gkers.py |grep --color=auto "[\d]*"); clear; echo -n $m; sleep 9; done
}

function delssh(){
  local a=$(ssh $1 2>&1|grep ssh-keygen|cut -d":" -f2)
  echo $a
}

alias tagsoup="java -jar /usr/share/java/tagsoup.jar"
alias hawtio="java -jar /usr/share/java/hawtio-app-1.4.52.jar"
function mode(){ # changes the <mode> of the msrv server
    sudo sqlite3 /var/lib/fio/data/cfg.dat "UPDATE config SET value=$1 WHERE config_key=28"
}
# mimetypes ~/.local/share/applications/mimeapps.list
function skin_image(){ # from management root, copy the <image> to all skin image folders
  find ./jsrc/ -type d -name resources-\*|xargs -I% cp $1 %/images$2
}
function sec(){
  echo $(($(($(date +%_H) * 3600)) + $(($(date +%_M) * 60)) + $(date +%_S)))
}
function totalsec(){
  echo $(( 24 * 3600 ))
}
function prompt_error(){
  err=$?
  if ! [ $err -eq 130 -o $err -eq 0 ]; then echo  $(tput setaf 1)$err\!$(tput sgr0); fi
}
function ofsec(){
  echo $(sec)"/"$(totalsec)
}
function standup(){ # see arandr
  xrandr --output VGA-0 --off --output DVI-I-1 --mode 1920x1200 --pos 0x0 --rotate normal --output DVI-I-0 --off --output HDMI-0 --mode 1920x1200 --pos 1920x0 --rotate normal
}
function sitdown(){ # see arandr
  xrandr --output VGA-0 --mode 1920x1200 --pos 0x0 --rotate normal --output DVI-I-1 --off --output DVI-I-0 --off --output HDMI-0 --off
}
alias disk_usage="baobab"
function stock(){
  curl -s http://dev.markitondemand.com/Api/v2/Quote?symbol=$1|xmlstarlet sel -t -c "StockQuote/LastPrice" -t -c "StockQuote/High" -t -c "StockQuote/Low" -t -c "StockQuote/Open"
  # this sucks: curl -H "Host:dev.markitondemand.com" -e "http://dev.markitondemand.com/" -A "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:24.0) Gecko/20100101 Firefox/24.0" -b "3481_0=DB7295A9D95CD9401A5AEA8C63F40A1A; GZIP=1; __utma=46446267.1986714918.1413929503.1413929503.1413929503.1; __utmb=46446267.3.10.1413929503; __utmc=46446267; __utmz=46446267.1413929503.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __utmt=1" -c /tmp/cookies http://dev.markitondemand.com/Api/v2/Quote?symbol=aapl|xmlstarlet sel -t -c "StockQuote/LastPrice" -t -c "StockQuote/High" -t -c "StockQuote/Low" -t -c "StockQuote/Open"
}
function b64i(){
  echo "<img src='data:image/png;base64,$(base64 $1)'/>"
}
alias unrootqt='sudo chown -R jfaust:jfaust /home/jfaust/.config/QtProject /hg/management/*'
function alternative() { # install <the link location> <the name> <the location of the exe> priority
   sudo update-alternatives --install /usr/bin/firefox firefox /opt/firefox-30/firefox 30
}
function dep-crap-mvn(){ # finds all the maven jars that we depend on
  for xxx in `find . -maxdepth 2 -name pom.xml`; do mvn -q -f $xxx dependency:build-classpath -Dmdep.outputFile=$xxx-derp; done
  fn *derp
  for xxx in `fn *derp`; do cat $xxx >> herp; done
  cat herp
  sed -e 's/:/\n/g' herp > herpe
  cat herpe
  <herpe sort|uniq > herpes
}

function inotify(){ # watch a <file> and notify changes by executing the <other file>
  file=$2
  if [ ! $2 ]; then file=$1; fi
  while inotifywait $1; do ./${file}; done
}
function jmapit(){ # gets the histogram for a java at <index> of ps -Cjava
  local pid
  pid=`ps -Cjava --no-header|sed -n "$1p"|awk '{print $1}'`
  echo `ps --no-heading $pid`
  jmap -histo $pid
}
# dubs --
function isItInTheDub(){ # looks through all the mobj databases for a <uuid>
  for dub in $(mobj .|head -n -1|tail -n75|cut -d ' ' -f 9|cut -d '(' -f 2|cut -d ',' -f 1);
    do [ "$(sudo sqlite3 -line "/var/lib/fio/data/m$dub.dat" "SELECT id FROM mobj_$dub" 2>&1|grep $1)" != "" ] && echo $dub;
  done
}
## ng --
alias bmq='bm quick-test'
alias bmf='bm fast-package'
alias bmcg='bm build-code-generator-amd'
alias bms='bm fastest-shade && echo shade was built!'
alias bmp='bm fastest-package'
alias bmd='bm fastest-package --dev'
alias bmb='bm build --dev'
## jmx --
alias lbm='bm ludicrous-speed -m "-o"'
alias tbm='bm faster-package'
alias fbm='bm fast-package -m'
function ibm () {
    rundir=.
    if [ -d integration-test ]; then rundir=integration-test; fi
    pushd ${rundir}
    mvn verify -P integration-test
    popd
}
#alias fbm='bm fast-package -m "-Dmaven.test.skip=true -Dpmd.skip=true -Dcpd.skip=true"'
#alias tbm='bm fast-package -m "-Dpmd.skip=true -Dcpd.skip=true"'
## fitnesse --
alias      wiki="bm fitnesse-startup -m '-rf :fio-jmx-fitnesse -Dmaven.test.skip=true -Dpmd.skip=true -Dcpd.skip=true'"
alias integrate="bm fitnesse-auto -m '-rf :fio-jmx-fitnesse -Dmaven.test.skip=true -Dpmd.skip=true -Dcpd.skip=true'"
## stuff --
function diffcmd(){ # diffs commandline output
  diff -u <($1) <($2)
}
function printjson(){
  python -c "import json; print json.dumps(json.load(open('$1')), indent=2)"
}
alias pj=printjson
function diskdump {
  python -c "
import json
for mobju in json.load(open('$1'))['objects']:
    for attru in mobju['mobj_update']:
        for attr in attru['attr_update']:
           print attr['id'], attr['str_val'] if attr.has_key('str_val') else attr['uint32_val'] if attr.has_key('uint32_val') else attr['uint64_val'] if attr.has_key('uint64_val') else attr['int64_val'] if attr.has_key('int64_val') else attr.keys()
"
}
alias lsjar="unzip -l " # ls jar file contents
function catjar { # cats the <jarfile>'s file contents for file in <path>
  local jarfile=$1
  local path=$2
  unzip -p $jarfile $path
}

# sequence diagram editor (sdedit)
alias sdedit='java -jar /usr/share/java/sdedit-4.01.jar'
function sc2 {
  xset r rate 295 20
  #xzoom -mag 3.7 -geometry 300x300
}
function inetup { # checks internet status; displays a dialog with the current time and "up/down"
  (while true; do d=$(date +"%T"); res=$($(ping -w1 -c1 google.com >/dev/null) && echo up || echo down); echo $(if [ "$res" = "up" ]; then echo 100; else echo 0; fi); echo "# $d $res   "; sleep 66; done)|zenity --progress --title="can i haz int-R-netz"
}
function sec2min {
  seconds=$1
  python -c "print ':'.join((str($seconds/60), str($seconds%60)))"
}
function min2sec {
  echo $(( $2 + ( $1 * 60) ))
}
function packets { # watches packets from localhost loopback interface to port 9051
  sudo tcpflow -i lo port 9051
}
function touchpad {
  if [ "$1" == "on" ]; then
   synclient TouchpadOff=0
  elif [ "$1" == "off" ]; then
   synclient TouchpadOff=1
  else
   echo "usage: touchpad [on|off]"
  fi
}
function vga {
  if [ "$1" == "right" -o "$1" == "left" ]; then
    xrandr --output VGA1 --off
    xrandr --output VGA1 --auto --$1-of LVDS1
  elif [ "$1" == "above" -o "$1" == "below" ]; then
    xrandr --output VGA1 --off
    xrandr --output VGA1 --auto --$1 LVDS1
  elif [ "$1" == "off" ]; then
    xrandr --output VGA1 --off
  else
    echo "usage: vga [right|left|above|below]"
  fi
}

function digital {
  if [ "$2" == "" ]; then
    output="DP-0"
  else
    output="$2"
  fi
  if [ "$1" == "right" -o "$1" == "left" ]; then
    xrandr --output $output --off
    xrandr --output $output --auto --$1-of LVDS-0
  elif [ "$1" == "above" -o "$1" == "below" ]; then
    xrandr --output $output --off
    xrandr --output $output --auto --$1 LVDS-0
  elif [ "$1" == "off" ]; then
    xrandr --output $output --off
  else
    echo "usage: vga [right|left|above|below]"
  fi
}

function laptop_display {
  if [ "$1" == "off" ]; then
    xrandr --output LVDS1 --off
  else
    xrandr --output LVDS1 --mode 1600x900
  fi
}

function heartbleed {
  THEIRS=$(date --date="$(check_ssl $1|grep Before|cut -d'=' -f2)" "+%s")
  FIXED=$(date --date="2014-04-07 19:45:14.000000000 +0000" "+%s")
  NOW=$(date "+%s")
  if [ $(($NOW - $FIXED)) -gt $(($NOW - $THEIRS)) ]; then
    echo fixed
  else
    echo broke
  fi
  echo $( displaytime $(($NOW - $FIXED)) ) " <-- time since openssl was fixed"
  echo $( displaytime $(($NOW - $THEIRS)) ) " <<< $1's cert should be younger"
}

function check_ssl {
  echo | openssl s_client -connect $1:443 2>/dev/null | openssl x509 -noout -dates
}

function displaytime {
  local T=$1
  local D=$((T/60/60/24))
  local H=$((T/60/60%24))
  local M=$((T/60%60))
  local S=$((T%60))
  [[ $D > 0 ]] && printf '%dd ' $D
  [[ $H > 0 ]] && printf '%dh ' $H
  [[ $M > 0 ]] && printf '%dm ' $M
  [[ $D > 0 || $H > 0 || $M > 0 ]] && printf ''
  printf '%ds\n' $S
}

function dlp() # download and import patch from reviewboard
{
  drbp $1;
  rbp $2;
}
function drbp()
{
  t=$(mktemp rb-$1-XXXXX);
  PYTHONPATH=/hg/tools/hgext/reviewboard ~/bin/reviewboard-patch.py --review $1|tail -n +3 > ${t};
  b=$(basename ${t}); mv ${t} ~/in/${b}.patch;
}
rbp() # move a reviewboard patch here, named <name>?
{
  local name="$1"
  if [ "$1" == "" ]; then
    name=$(basename ~/in/rb*patch)
  fi
  mv ~/in/rb*patch ".hg/patches/$name"
  hg qimport -e "$name"
}
bat()
{
  upower -i $(upower --enumerate|grep battery)
}
alias xmlns='sed '\''s/xmlns="[^"]*"//'\'''
getjira() # gets the "key: value" text using <jira_id>
{
  curl -vk -ujfaust https://essjira.sandisk.com/browse/$1 | java -jar /usr/share/java/tagsoup.jar > /tmp/getjira.html
  sed -i 's/xmlns="[^"]*"//' /tmp/getjira.html
  key=$(</tmp/getjira.html xmlstarlet sel -t -c '//a[@id="key-val"]/text()')
  val=$(</tmp/getjira.html xmlstarlet sel -t -c '//h1[@id="summary-val"]/text()')
  echo $key: $val;
}
alias unwake='sudo umount /dev/fioa && sudo modprobe -r iomemory_vsl && sudo pm-suspend'
alias wake='sudo modprobe iomemory-vsl && sudo mount /dev/fioa /mnt/iodrive '

getlast() # to print out the last command line invoking <mycommand>
{
  fc -nl "$1" "$1"
}
alias lnk="gnome-desktop-item-edit ~/Desktop/ --create-new"
getpass()
{
  /home/jfaust/bin/obtain_ion_password -H $1
#  if [ -e /hg/flashcenter/tools/getrootpass ]; then
#    /hg/flashcenter/tools/getrootpass $1
#  else
#    curl -s -X POST -d "SSN=$1" http://10.50.39.115/cgi-bin/getpass.pl|java -jar /usr/share/java/tagsoup.jar|sed 's/xmlns="[^"]*"//'|xmlstarlet sel -t -c "//font[2]/text()"|grep -oP "(?<=password is ').*\b"|tr -d "\n"
#  fi
}
ctime()
{
  date -d @$1
}
# invert screen colors
alias invert='xcalib -i -a'
#download ion to xsilentbob
tarxf()
{
  for file in `find . -maxdepth 1 -name \*.tar\* -type f -o -name \*bz2\* -type f`
  do
    if [ -f "$file" ]; then
      mkdir "$file-dir";
      tar xf "$file" -C "$file-dir";
    fi
  done
}
getion()
{
  sshpass -pcentcio ssh root@xsilent-bob "sh" < ~/bin/getion.sh
}
getthision()
{
  sshpass -pcentcio ssh root@xsilent-bob "sh" < <(sed ~/bin/getthision.sh -e 's|\$1|'$1'|g')
}

alias sshjvc='sshpass -p mmaCWxVL ssh fusionservice@10.50.33.56'
alias sshjvc='sshpass -p mmaCWxVL ssh fusionservice@10.50.33.79'
alias sshjvc='sshpass -p mmaCWxVL ssh fusionservice@10.50.33.67'
alias sshjvc='sshpass -p mmaCWxVL ssh fusionservice@10.50.33.64'

alias days='echo $(($(date -d 1-May +%j) - $(date +%j))) days until Derrick moves out!'

alias xui="echo 'mv /usr/share/fio/fio /usr/share/fio/fio-released; mkdir /usr/share/fio/fio/; tar xf output.tar ; mv output/resources/html /usr/share/fio/fio'"
alias sshn1="ish 10.50.141.152"
alias sshn2="ish 10.50.141.154"
alias sshnm="ish 10.50.141.10"

alias bohr='ish bohr'
alias doppler='ish doppler'
alias planck='ish planck'

alias faraday='ish faraday'
alias coulomb='ish coulomb'
alias joule='ish joule'

# make a partition that takes up the entire disk (stack overflow)
fill_the_disk()
{
  parted -s -a optimal $1 mklabel gpt -- mkpart primary ext4 1 -1
}
kt()
{
  kate $* > /dev/null 2>&1 &
}
alias ion_mode='sudo sqlite3 -line /var/lib/fio/data/cfg.dat "update config set value=2 where config_key=9"'
alias ios_mode='sudo sqlite3 -line /var/lib/fio/data/cfg.dat "update config set value=0 where config_key=9"'
keyup()
{
 for i in `seq 1 $1`; do
  dlk $2 > /var/lib/fio-sim$i/agent_keys/$2.int.fusionio.com.key
 done
}
alias wf="./fio-status --version | sed -e s'|.*@\(.*\)|curl http://hg.int.fusionio.com/firehose/raw-file/\1/src/fpga-image/INFO|'" ## what firmware dude? John Calcote!
destroy_the_world()
{ # completely re-writes your leb map. pretty haneous.
  sudo load-driver -anN
  sudo ./fio-write-lebmap -c /dev/fct0
  sudo ./fio-format /dev/fct0
  sudo ./load-driver
}
alias dvdgrp='sudo chmod 660 /dev/sr0;sudo chgrp cdrom /dev/sr0'
alias chat='irssi -c irc.freenode.net -w Nonth1ng -n activedecay'
function nautilus()
{
  /usr/bin/nautilus $* --no-desktop --browser >/dev/null 2>&1 &
}
tres()
{
  # echo $(urlescape $*)
  curl -s http://www.dictionaryapi.com/api/v1/references/spanish/xml/$(urlescape $*)?key=951eee25-5245-4ac2-84dd-0d867dade3a2|xmlstarlet fo
# curl -s http://www.spanishdict.com/translate/$1 | java -jar /usr/share/java/tagsoup.jar | sed 's/xmlns="[^"]*"//' > ~/hack/espanol.html; <~/hack/espanol.html xmlstarlet sel -t -c "//html/body/div/div/div/div/div[@class='quickdef']//div[@class='el']/a[1]/text()"; <~/hack/espanol.html xmlstarlet sel -t -c "//html/body/div/div/div/div/div[@class='quickdef']//div[@class='el']/a[2]/text()"
#  curl -s http://www.spanishdict.com/translate/$1| java -jar /usr/share/java/tagsoup.jar|sed 's/xmlns="[^"]*"//' | xmlstarlet sel -t -c "//html/body/div/div/div/div/div/div/div/a/text()"
#  curl -s http://www.spanishdict.com/translate/$1 | grep -E "class=\"quick_def\"|class=\"word\"" | sed 's/<[^>]*>/ /g;s/^ *//g;s/ *$//;s/ \{1,\}/ /g'
}
alias junk='mv jsrc/IoManager/target/generated-sources/ .; rm -rf jsrc/IoManager/target/* ; rm -rf jsrc/IoManager/target/.generated ; mv generated-sources jsrc/IoManager/target/'
alias doit='bm -bpx; junk'
alias doin='bm -bpnx; junk'
alias die='bm -xbn; junk'
alias dont='pushd jsrc/IoManager; rm target -r ;mvn package -Dmaven.test.skip=true -Pdev -Dskin=fio;popd;junk'
alias dond='pushd jsrc/IoManager; rm target -r ;mvn package -Dmaven.test.skip=true -Pdev -Dskin=dell;popd;junk'
alias daad='pushd jsrc/IoManager; rm target -r ;mvn package -Dmaven.test.skip=true -Pdev -Dskin=daad;popd;junk'

dsk() # overwrite your current skin files with the new (skin)
{
  if [ $# -eq 0 ]; then echo "not enough arguments. 1 required (skin)"; return 1; fi
  if [ -d jsrc ]; then
  skin=$1; shift
  pushd jsrc/IoManager
    rm -r war
    mvn resources:resources -Dskin=$skin;
    cp -R war/WEB-INF/classes/* ../../output/resources/html
  popd
  else
    echo "you're not likely at the management root"; return 1;
  fi
}


# alias helpers
alias realias='. ~/.bash_aliases'
alias new='idea ~/bin/.bash_aliases.sh'
alias hs='ls ~/.bash_aliases | xargs grep --color=auto' # help scripts (raw)
hso() # help scripts (optimized); optimizes out the garbage inside the alias, and just shows the comment.
{
  hs $1 | sed 's/.*#/####/g'
}


# linux aliases
alias l='ls -laF'
alias lapdesk='rdesk $(lappy)'
alias lappy-ping='ping slce411961 -c1|head -n1|grep -Eo "([[:digit:]]+\.){3}[[:digit:]]+"'
alias lappy="nmap -sP 10.50.33.0/24|grep slce411961|cut -d'(' -f2|cut -d')' -f1"
function rdesk(){
 rdesktop $1  -x b -r sound -r clipboard -d sdcorp -u 24818 -p Boiaser5 -g 1920x1186 &
}
ipscan() # scans the (ip_address) passed in for all open hosts that appear to be up. network discovery!
{
  nmap -sP $1 # example ipscan 10.50.33.0/24
}
psa()
{
  proc=$1; shift
  ps -A | grep $proc | sed 's/ ?[0-9]*.*//g;s/ //g' | xargs $*
}
alias grip='grep -i'
alias grepls='grep -l' # lists file names without match line in the file
function fn { # find in . with <name1> or <name2> or <nameN>... [-c] copies to clipboard
  local dir='.'
  local args=""
  local copyit=0
  if [ "$1" == "-c" ]; then copyit=1; shift; fi
  if [ "$1" == "-f" ]; then fearch=" -type f "; shift; fi

  #read into array (-a)
  IFS="$IFS," read -ra names <<< "$*"
  for name in "${names[@]}"; do
    if [ "$args" == "" ]; then
      args="-name $name $fearch";
    else
      args="$args -o -name $name $fearch";
    fi
  done
  if [ $copyit == 1 ]; then
    echo -n find $dir $args|xsel -b;
  else
    find $dir $args
  fi
}
fdg() # find in (directory) a (file)  having contents (grep)
{
  if [ $# -eq 0 -o $# -eq 1 -o $# -eq 2 ]
    then
      echo "Not enough arguments supplied; 3 are required (dir name grep)."
  else
    TEMP=`getopt --options f:d:g:v --long file,directory,grep,verbose --name 'bash_aliases.sh' -- "$@"`
    eval set -- "${TEMP}"

    directory=
    file=
    grenades=

    while true ; do
      case "$1" in
        -f|--file) file="$2"; shift 2 ;;
        -d|--directory) directory="$2"; shift 2 ;;
        -g|--grep) grenades="$2"; shift 2 ;;
        -v|--verbose) verbose="$1"; shift ;;
        --) shift ; break ;;
        *) echo "Unhandled option $1" ; shift ;;
      esac
    done

    for arg #these arguments were not parsed by the case "$1" statement.
    do
        if [ -z "${directory}" ]; then
            directory=${arg}
        elif [ -z "${file}" ]; then
            file=${arg}
        else
            if [ -z "${grenades}" ]; then
                grenades="${arg}"
            else
                grenades="${grenades} ${arg}"
            fi
        fi
    done

    if [ "${verbose}" ]; then
        echo find "${directory}" -type f -name "${file}" \| xargs -e grep --color=auto -nH \"${grenades}\";
    fi
    find "${directory}" -type f -name "${file}" | xargs -e grep --color=auto -nH "${grenades}"

    unset arg directory grenades file TEMP verbose
  fi
}
# == SQL queries ==

dsc() # sqlite3 describe and show the schema for the (mobj_type)
{
  if [ $# -eq 0 ]
    then
      echo "Not enough arguments supplied; 1 is required (mobj_type)."
  else
    echo sudo sqlite3 -line /var/lib/fio/data/m$1.dat \".schema mobj_$1\"
    sudo sqlite3 -line /var/lib/fio/data/m$1.dat ".schema mobj_$1"
  fi
}
sel() # sqlite3 select the (mobj_type <1, 2, etc.>) showing the (attributes <*, a123, etc.>)
{
  if [ $# -eq 0 -o $# -eq 1 ]
    then
      echo "Not enough arguments supplied; 2 are required (mobj_type attributes)."
  else
   echo sudo sqlite3 -line /var/lib/fio/data/m$1.dat \"SELECT "$2" FROM mobj_$1 $3\"
   sudo sqlite3 -line /var/lib/fio/data/m$1.dat "SELECT $2 FROM mobj_$1 $3"
  fi
}
upd() # sqlite3 update (mobj_type)'s table with (values) (where) there's a match UPDATE table_name SET column1=value, column2=value2,... WHERE some_column=some_value
{
  if [ $# -eq 0 -o $# -eq 1 -o $# -eq 2 ]
    then
      echo "Not enough arguments supplied; 3 are required (mobj_type values where)."
  else
    echo sudo sqlite3 /var/lib/fio/data/m$1.dat \"UPDATE "mobj_$1" SET "$2" WHERE "$3"\"
    sudo sqlite3 /var/lib/fio/data/m$1.dat "UPDATE mobj_$1 SET $2 WHERE $3"
  fi
}
ins() # sqlite3 insert into the (mobj_type fld_search)'s table the row with (attributes_list)
{
  unset outAttr outVal comma execute stuff total tmp
  if [ $# -eq 0 -o $# -eq 1 ]
    then
      echo "Not enough arguments supplied; 2 are required, 1 optional (mobj_type fld_search [unique_number])."
  else
    ky=0
    if [ "$3" ]; then ky=$3; fi
    tmp=`wcalc -P0 "$1<<48"`
    tmp=`expr ${tmp:2} + $ky`
    echo ${tmp}

    fld $2 | sed 's/.*id="\([^"]*\)".*name="\([^"]*\)".*/a\1,\2/' > /tmp/foo.txt
    total=0
    for stuff in `cat /tmp/foo.txt`;
    do
        total=`expr $total + 1`;
    done
    for stuff in `cat /tmp/foo.txt`;
    do
        field=`echo $stuff | sed 's/,.*//'`;
        name=`echo $stuff | sed 's/.*,//'`;
        echo $name \($field\) $total;
        total=`expr $total - 1`;

        read line;
        outAttr=$outAttr${comma}$field;
        outVal=$outVal${comma}$line;
        comma=","
    done
    echo sudo sqlite3 -line /var/lib/fio/data/m$1.dat \"insert into mobj_$1 \(key,$outAttr\) values \(${tmp},$outVal\)\;\"
    echo -n "execute? "; read execute;
    if [ "$execute" == "y" ];
      then
      sudo sqlite3 -line /var/lib/fio/data/m$1.dat "insert into mobj_$1 (key,$outAttr) values (${tmp},$outVal);"
    fi
  fi
}
del() # sqlite3 delete the row from (mobj_type <1, 2, etc.>)'s table using the (where_clause)
{
  if [ $# -eq 0 -o $# -eq 1 ]
    then
      echo "Not enough arguments supplied; 2 are required (mobj_type where_clause)."
  else
    sqlite3 /var/lib/fio/data/m$1.dat "DELETE FROM mobj_$1 WHERE $2"
  fi
}
# == mount ==
alias tesp='sudo mount -t cifs //10.50.3.233/users/jfaust/hg /mnt/tespey-test -o username=jfaust,password=w0\(\)dyMcwooderson,domain=FUSIONIO'
alias egg='sudo mount -t cifs //10.50.33.66/super -o username=super,password=liedicm /mnt/chickenlord' # mount chickenlord. user/pass admin/admin
alias gil='sudo smbmount //gil/files /mnt/gil -o user=guest -o password=guest'
# == project file for qtcreator ==
alias qtincludes="find . -name include -type d | xargs -I dir find dir -name *.h| sed 's/\.\///;s/\(.*\)\/.*/\1/;s/management_libs\/.../management_libs\/current/' | uniq"
alias qtfiles='find . -name *.cpp -o -name *.h | sed "s/.\///;s/management_libs\/.../management_libs\/current/"'
alias qtnew='qtincludes > mgmt-qtproj.includes; qtfiles > mgmt-qtproj.files'

# MANAGEMENT HELPERS ---
alias docmgmt='firefox ./misc/iomgr_payload_model/doc/endpoints.html&'
alias fld='ls ./misc/model/fields.xml | xargs egrep --color=auto' # look for a field.properties id or attribute
flids()
{
  for x in `echo "$*"|sed 's/a//g;s/ //g;s/\n/ /g;'` ; do fld "\"$x\" "; done
}
alias mobj='find . -name Enumerations.java | xargs grep "public enum ManagedObjectType" -A 77 | grep -i'
# == build test ==
alias mvn-dbg='mvn -Dgwt.logLevel=ALL -Dmaven.test.skip=true -Pdev -Dskin=fio' # to debug maven builds
# == generate ==
alias mgen='./misc/model/run.py -n'
alias mgenq='./misc/model/run.py -B'
alias mgenc='./misc/model/run.py'
alias mgp='java -jar "/hg/management/jsrc/ModelGen/target/ModelGen.jar" /iomanager "/hg/management/misc/iomgr_payload_model"'
alias mgdal='bm dsl-codegen'
# == build ==
alias bdsm='mvn package -Dproject.buildNumber=$(echo "jfaust.$(date +%F_%r|tr " -" "_"|tr ":" ".")") -Dmaven.test.skip=true'
alias bm='./build.py' # build management
alias bmm='./build.py -m' # build management
alias bs='scons -k -u FUSION_VERSION_STRING=0.0.0 FUSION_BUILD_VERSION=0' # -k is keep going if experiencing errors.
alias bs12='bs -j12'
alias bs8='bs -j8'
alias bs6='bs -j6'
alias bs4='bs -j4'
alias glr="st | grep master.xml | sed 's/[^/]*.master.xml/.gen_lastrun/g' | sed 's/[\?!MRA] //g' | xargs touch" # web "gen last run" file create
alias grl="st | grep master.xml | sed 's/[\?!MRA] //g' | xargs touch" # web Gen, Run the Last modified masters
alias dgrl="find . -name .gen_lastrun | xargs rm"
alias qgrl="qr -X re:.*master.xml; grl" # web Gen, Run the Last modified masters in the current patch
alias css='cp jsrc/IoManager/resources/*.css output/resources/html/' # copy css resources to output
alias img='cp --recursive ./jsrc/IoManager/resources/images output/resources/html' # copy image resources to output
# == run ==
msrvreq() # sets up all the directories that you need, kthx
{
echo This command destroys the /var/lib/fio directory. Really proceed? \(y/n\)

read choice
if [ $choice = "y" ] || [ $choice = "Y" ]; then
    echo treating $PWD as management repository
    management=$PWD
else
    return 0
fi

# PREREQUISITES:
sudo rm -r /usr/share/doc/fio-msrv
sudo mkdir /usr/share/doc/fio-msrv
sudo chown jfaust:jfaust /usr/share/doc/fio-msrv
sudo rm -r /var/lib/fio
sudo mkdir /var/lib/fio
sudo chown jfaust:jfaust /var/lib/fio
sudo rm -r /etc/fio
sudo mkdir /etc/fio
sudo chown jfaust:jfaust /etc/fio
sudo rm -r /usr/share/fio
sudo mkdir /usr/share/fio
sudo chown jfaust:jfaust /usr/share/fio
sudo rm -r /var/log/fusionio
sudo mkdir /var/log/fusionio
sudo chown jfaust:jfaust /var/log/fusionio

cp -r src/util/fio-msrv/resources/* /var/lib/fio
mv /var/lib/fio/template.cfg_version /var/lib/fio/.cfg_version
mv /var/lib/fio/template.idp_version /var/lib/fio/.idp_version

cp -r src/util/fio-agent/resources/* /var/lib/fio
mv /var/lib/fio/fio-agent-cfg.template.xml /var/lib/fio/fio-agent-cfg.xml
mv /var/lib/fio/fio-agent-cfg.xml /etc/fio
mv /var/lib/fio/diskdump.cfg /usr/share/fio
mkdir /var/lib/fio/agent_keys/disabled
mv /var/lib/fio/agent_keys/fms* /var/lib/fio/agent_keys/disabled

cp -r /var/lib/fio/logcfg /usr/share/fio
rm -r /var/lib/fio/logcfg

pushd /usr/share/fio
ln -s $management/output/resources/html html
popd

echo
echo done
echo
echo /var/lib/fio
ls -Al /var/lib/fio
echo /etc/fio
ls -Al /etc/fio
echo /usr/share/fio
ls -Al /usr/share/fio
echo /var/log/fusionio
ls -Al /var/log/fusionio
echo /usr/share/doc/fio-msrv
ls -Al /usr/share/doc/fio-msrv
}

alias killsims='pkill -f manage.py; pkill -f fio-agent'
alias showsims='ps -fp $(pgrep -d, -f manage.py); ps -fp $(pgrep -d, -f fio-agent)'
alias simsuper='python `find . -name manage.py` createsuperuser --username=jfaust --email=a@b.com'
sim()
{
  sim_number=$1
  port=9052
  site=1
  if [ $# -eq 0 ]; then
      echo "Starting simulator on default port ($port) with default site ($site)"
      python manage.py runserver 0.0.0.0:$port
  else
      port=`expr $port + $sim_number`
      site=`expr $site + $sim_number`
      echo "Starting simulator on port ($port) with settings_site($site)"
      python manage.py runserver 0.0.0.0:$port --settings=settings_site$site
  fi
}
alias resim="./reset_db.py;./populate_db.py;sim"
alias simput="curl -H \"Content-Type: application/json\" -X PUT -d" # put simulator json, ex: '{\"current_errors\":2}' localhost:9052/vsl_saft/node/xxx
agent()
{
  if [ $# -eq 0 ]; then
    echo "agent -f"
    ./linux2-x86_64/output/bin/fio-agent -f
  else
    # s has an optional argument, t has an optional argument
    TEMP=`getopt --options s::t:: --long sim-number::,config-dir:: --name 'bash_aliases.sh' -- "$@"`
    if [ $? != 0 ]; then echo "bash_aliases.sh: Your args are all messed up... TERMINATED." >&2; return 1; fi
    eval set -- "${TEMP}"
    unset TEMP

    port=9052 # default port
    config=/var/lib/fio

    while true ; do
      case "$1" in
        -s|--sim-number)
          case "$2" in
              "") echo "using default port (${port})"; shift 2 ;;
              *)  sim_number=$2; port=`expr ${port} + $2`; shift 2 ;;
          esac
          simulation=" -s127.0.0.1:${port}" ; ;;
        -t|--config-dir)
          case "$2" in
              "") echo "using default config (${config})"; shift 2 ;;
              *)  config=${config}-$2; shift 2 ;;
          esac
          configuration_dir=" -t${config}"
          if [ ! -d "${config}" ]; then
              echo "Making directory: \`${config}'";
              sudo mkdir ${config};
              sudo chown jfaust:jfaust ${config};
          fi ;;
        --) shift ; break ;;
        *) echo "bash_aliases.sh: Forgot to handle a case here... TERMINATED." ; return 1 ;;
      esac
    done

    if [ "${sim_number}" != "" -a "${configuration_dir}" = "" ];
      then # the sim number was set, but the config directory was not. interpret this as a non-default config dir.
        configuration_dir=" -t${config}-sim${sim_number}"; fi

    #args=
    #for arg do args="$args -$arg" ; done #these arguments were not parsed by the case "$1" statement.

    echo "Executing: ./linux2-x86_64/output/bin/fio-agent -f${configuration_dir}${simulation}${args}"
    ./linux2-x86_64/output/bin/fio-agent -f${configuration_dir}${simulation}${args}
    unset configuration_dir # stop pollution now!
    unset sim_number        # stop pollution now!
    unset simulation        # stop pollution now!
    unset args
  fi
}
alias msrv="sudo ./linux2-x86_64/output/bin/fio-msrv -f" # fio-msrv -f
alias alertrules="echo copied to clipboard; ./linux2-x86_64/output/bin/fio-msrv --dump-alert-rules confluence-page | xsel -b"
dat() # remove files from var lib fio data
{
  sudo ls /var/lib/fio/data/$1
  sudo rm /var/lib/fio/data/$1
}
datcp()
{
  sudo cp $1/m*.dat /var/lib/fio/data
}
datm() # remove only managed object files from var lib fio data
{
  ls /var/lib/fio/data/m*.dat
  ls /var/lib/fio/data/m*.backup
  sudo rm /var/lib/fio/data/m*.dat
  sudo rm /var/lib/fio/data/m*.backup
}
datall() # remove all dat and backup files!
{
  ls /var/lib/fio/data/*.dat
  ls /var/lib/fio/data/*.backup
  sudo rm /var/lib/fio/data/*.dat
  sudo rm /var/lib/fio/data/*.backup
}
dlk()
{
  curl -k -H "accept: application/octet-stream" -u "admin:asdfasdf" -X GET https://$1:9051/admin/agentkey/$1.int.fusionio.com.key
}

# hg --- mercurial
function stls() { # finds the actual files that have had rejects
  st|awk '{print $2}'|sed 's/.rej//'
}
function thg(){
  /usr/bin/thg $* >/dev/null 2>&1 # tortoise hg quiet!
}
alias vdi='/usr/bin/thg vdiff > /dev/null 2>&1 &' # tortoise hg quiet!
alias srv='hg serve'
alias stp='hg strip'
alias stt='hg strip tip'
alias htt='hg transplant tip'
alias smoke='hg smoke'
alias pushit='io;hg push;io'
alias rev='hg revert'
lvTemplate="{rev}: {label('diff.extended', node|short)} {branch} {tags}\nfrom: {author|user} {date|isodate}\ndesc: {desc}\n======:--------------------------------------\n"
logTemplate="{rev}: {label('diff.extended', node|short)} {branch} {tags} {author|user} {date|isodate}\n~ {desc|firstline}\n----------:----------------------------------\n"
alias in='hg in --quiet -G --template "${logTemplate}"'
function out(){
  hg out -G --quiet --template "${logTemplate}"
}
shruggy="¯\\_(ツ)_/¯"
alias io='in; echo "${shruggy}"; out'
alias pur='hg pur'
alias prg='pur'
alias st='hg st'
alias di='hg diff'
alias ar='hg addremove -s 100'
alias lvc='tmpl 1 "{desc}" | head -n1 | xsel -b'
alias ms='hg ms'
reb() # rebase from (source) to (destination)
{
  if [ $# -eq 0 -o $# -eq 1 ]
    then
      echo "Not enough arguments supplied; 2 are required (source destination)."
  else
    hg rebase -s$1 -d$2
  fi
}
re() # pull (repo) and update (branch)
{
  hg pull $1
  hg update $2
}
tmpl() # hg log template, limited by count
{
  hg log -l"$1" --template "$2"
}
lv() # log verbosely (count=1) changesets
{
  if [ $# -eq 0 ]; then
    set - 1
  fi
  hg log -G --template "${lvTemplate}" -l $*
}
loj() # log verbosely (grep) (count=1) changesets
{
  grep=$1
  count=$2
  if [ $# -eq 0 ]; then
      echo "No arguments supplied; 1 required 1 optional (grep, count=100). Exiting."
  elif [ $# -eq 1 ]; then
      count=100
  fi
  hg log -G --template "${logTemplate}" -l ${count} | egrep ${grep}
}
log() # log (count=3) changesets
{
  if [ $# -eq 0 ]; then
    set - 4
  fi
  hg log -G --template "${logTemplate}" -l $*
}
rpat() # log verbosely and open urls to reviewboard based on whats in the commit message
{
  arg=$1
  if [ $# -eq 0 ]
    then
      echo "No arguments supplied; 1 required (count=1). Defaulting."
      arg=1
  fi
  lv $arg | grep https://reviews.int.fusionio.com/r/ | sed 's/.*\(http\)/\1\/diff\/raw/g' >> /tmp/rpats
  qa
  if [ $? != 0 ]; then echo "error, applied patches"; return 1; fi
  for line in `cat /tmp/rpats`;
  do
    echo $line
    wget $line
    mv raw .hg/patches/
    hg qimport -e raw
    hg qpush
  done
}
lvr() # log verbosely and open urls to reviewboard based on whats in the commit message
{
  arg=1
  if [ $1 ]; then arg=$1; fi
  google-chrome --new-window $(lv ${arg} | grep https://reviews | grep -o "http.*") >/dev/null
}
lvj() { # log verbosely and open urls to JIRA based on whats in the commit message
    arg=1
    if [ $1 ]; then arg=$1; fi
    jiras=$(tmpl ${arg} '{desc|firstline}\n' | sed 's/\(.*\):.*/\1/' | tr ',' ' ')
    google-chrome --new-window $(for element in ${jiras}
            do echo https://essjira.sandisk.com/browse/${element}
        done) >/dev/null
}
#tmpl() # hg log template, limited by count
#{
#  hg log -l"$1" --template "$2"
#}
fch() # files changed in <count> changesets
{
  for x in $(tmpl $1 "{rev}\n"); do
    for line in $(hg status --no-status --change ${x});
      do echo ${x} ${line}
    done
  done
}
# == gking ==
alias unb='hg unb' # unbundle
alias gkdo='unb ~/in/gk/*.hg' # do a gk bundle
alias gkls='ls ~/in/gk/*.hg' # list the gk bundles
alias gkcl='rm ~/in/gk/*.hg; mv ~/in/*.hg ~/in/gk' # clean the gk bundle directory
alias gkc='gkcl;re' # clean the gk bundle directory
alias gki='pushd /hg/gkers;hg pull -u -q;./gkers.py -ujfaust;hg ci -m "jfaust gk";hg push -q;popd' # increment my gk count
alias gkdoki='gkdo;gki'
alias gkj='gkdo;gki'
alias lkj='gkdo;gki;io;lv'
alias gkr='pushd /hg/gkers 2>&1>/dev/null;hg pull -u -q;./gkers.py;rev -a -q;popd 2>&1>/dev/null' # tell who is gk
alias gker='gkr'
alias gkp='pushd /hg/gkers 2>&1>/dev/null;hg pull -u -q;./gkers.py -p;rev -a -q;popd 2>&1>/dev/null' # print all gk counts
gkset() # set the current gker to be (someone)
{
  if [ $# -eq 0 ]
    then
      echo "Not enough arguments supplied; 1 required (someone)."
  else
    pushd /hg/gkers
    hg pull -u
    ./gkers.py -s$1
    hg ci -m "changed gker to $1"
    pushit
    popd
  fi
}
me() # auto-MErges (source) to (destination)
{
  if [ $# -eq 0 -o $# -eq 1 ]
    then
      echo "Not enough arguments supplied; 2 are required (source destination)."
  else
    hg up $2
    hg me $1
    hg ci -m "merged $1 to $2"
  fi
}
meed() # MErges (source) to (destination) and allows EDits
{
  if [ $# -eq 0 -o $# -eq 1 ]
    then
      echo "Not enough arguments supplied; 2 are required (source destination)."
  else
    hg up $2
    hg me $1
  fi
}
meno() # MErges (source) to (destination) but does it NO-op
{
  if [ $# -eq 0 -o $# -eq 1 ]
    then
      echo "Not enough arguments supplied; 2 are required (source destination)."
  else
    hg up $2
    hg me $1
    hg rev -r$2 -a
    hg ci -m "no-op merged $1 to $2"
  fi
}
# == phase ==
alias phaseoff='hg phase --force --draft '\''public() and outgoing()'\'''
alias pha='phaseoff'
# == hg ==
alias blam="hg blame -nuc"
alias vdiff='hg extdiff -p meld'
alias hgid='hg id'
alias up='hg up'
alias vaporize='rev -a; pur'
# == queue ==
alias qr='hg qref'
alias qre='hg qref -e'
function qrx(){ # each argument is -X <ignored-file>
    local ignores
    for arg in "$@"; do ignores="-X $arg ${ignores}"; done
    hg qref ${ignores}
}
alias qri='hg qref -I'
alias qrl="gx ; hg qref -X listfile:tmp.gx.txt ; rm tmp.gx.txt" # exclude generated files from queue patch
nl=$'\n'
alias qrm='hg qref -m"$(tmpl 1 "{desc}")$nl' # qref modify commit message, usually to insert a review
alias qn='hg qnew'
alias qren='hg qrename'
alias qd='hg qdelete'
alias qi='hg qimport'
alias qt='hg qimport -rtip'
alias qdi='hg qdiff'
alias qst='hg qdiff --stat'
alias qs='hg qser -s'
alias q='hg qser'
alias qa='hg qap -s'
alias qpo='hg qpop'
alias qpfo='hg qpop; echo folding...; qfo'
alias qpa='hg qpop -a'
alias qpm='hg qpush --move'
alias qpu='hg qpush'
alias qf='hg qfinish -a'
alias qfo='hg qfold'
function qls(){
  qst|sed 's/ \(.*\)|.*/\1/'|head -n -1
}
# == queue rejects ==
alias irej='st | grep "^\?" | sed "s/\? //g" | xargs cat' # cat reject files
# == postreview ==
alias po='hg postreview'
alias poms='hg postreview -i111 --git -p'
alias pog='grep '\''review.*published'\'' | sed '\''s/.*\(http.*\)/Review: \1"/'\'' | xsel -b'
alias pco='hg po -p --git -i7 -Gmanagement-core-reviewers' # post review to management repository
alias pui='hg po -p --git -i7 -Gmanagement-gui-reviewers' # post review to management repository
alias pux='hg po -p --git -i7 -Gmanagement-ux-reviewers' # post review to management repository
alias pjx='hg po -p --git -i111 -Gmanagement-jmx-reviewers' # post review to management service (SMF) repo
alias pjxm='pjx -mqparent' # post review to management service (SMF) repo
alias png='hg po -p --git -i124 -Gmgmt-angular-js' # post review to AngularJS GUI for SMF
alias pngm='png -mqparent'
alias pfi='hg po -p --git -i139 -Gmanagement-core-reviewers' # post review to management ioncli fikon repository
alias poe='hg po --git -mqparent -e' # post existing
poa() # POst Automatic review; get the changeset number from the review in the tip commit message
{
  poe `lv 1 | grep https://reviews | sed 's/[^0-9]//g'`
}
pod()
{
  poe `lv 1 | grep https://reviews | sed 's/[^0-9]//g'` -d "$(hg log -l 1 --template {desc})"
}
# smoking ---
ss1() # Smoke Status 1 of the (build_number)
{
  if [ $# -eq 0 ]
    then
      echo "Not enough arguments supplied; 1 required (build_number)."
  else
    echo http://jenkins.int.fusionio.com:8080/view/All/job/dev-smoke-mg-01/$1/SuperPu-Build-Servers=windows/consoleText
    echo http://jenkins.int.fusionio.com:8080/view/All/job/dev-smoke-mg-01/$1/SuperPu-Build-Servers=debian6maven/consoleText
    curl -s http://jenkins.int.fusionio.com:8080/view/All/job/dev-smoke-mg-01/$1/SuperPu-Build-Servers=windows/consoleText  | grep -i build.succ
    curl -s http://jenkins.int.fusionio.com:8080/view/All/job/dev-smoke-mg-01/$1/SuperPu-Build-Servers=debian6maven/consoleText  | grep -i build.succ
  fi
}
ss2() # Smoke Status 2 of the (build_number)
{
  if [ $# -eq 0 ]
    then
      echo "Not enough arguments supplied; 1 required (build_number)."
  else
    echo http://jenkins.int.fusionio.com:8080/view/All/job/dev-smoke-mg-02/$1/SuperPu-Build-Servers=windows/consoleText
    echo http://jenkins.int.fusionio.com:8080/view/All/job/dev-smoke-mg-02/$1/SuperPu-Build-Servers=debian6maven/consoleText
    curl -s http://jenkins.int.fusionio.com:8080/view/All/job/dev-smoke-mg-02/$1/SuperPu-Build-Servers=windows/consoleText | grep -i build.succ
    curl -s http://jenkins.int.fusionio.com:8080/view/All/job/dev-smoke-mg-02/$1/SuperPu-Build-Servers=debian6maven/consoleText | grep -i build.succ
  fi
}

alias ion_latest="rm LATEST && wget -q jenkins/ion/coffee/LATEST && tagsoup LATEST | xmlstarlet fo | xmlstarlet el -v | grep -o href\.\*| grep -e iop\' -e iso\'| sort"


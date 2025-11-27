FROM bellsoft/liberica-openjdk-alpine:latest

# Install curl & jq
RUN apk add curl jq
#Worksspace
WORKDIR /home/selenium-docker

# Add the reuired files into 'home' directory '.'
ADD target/docker-resources     .
ADD runner.sh                   runner.sh

# Environment Variables
# BROWSER
# HUB_HOST
# TEST_SUITE
# THREAD_COUNT

# Run the test
#ENTRYPOINT [ "sh", "-c", "java -cp 'libs/*' -Dselenium.grid.enabled=true -Dselenium.grid.hubHost=${HUB_HOST} \
#             -Dbrowser=${BROWSER} org.testng.TestNG -threadcount ${THREAD_COUNT} test-suites/${TEST_SUITE}"]
ENTRYPOINT ["sh", "runner.sh"]
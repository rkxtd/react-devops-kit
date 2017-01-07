.PHONY: create-dist

#some constants
APP_NAME=app
BUILD_DIR=build

configure:

create-dist:
	@echo Building application
	npm run build
	@echo Create a build dir
	rm -rf $(BUILD_DIR)
	mkdir -p $(BUILD_DIR)
	tar czvf $(BUILD_DIR)/${APP_NAME}-${BUILD_NUMBER}-${BRANCH_NAME}.tar.gz api/** \
            bin/** \
            src/** \
            static/** \
            webpack/** \
            infrastructure/AWSCodeDeploy/** \
            appspec.yml .commit-hash \
            package.json \
            server.babel.js .babelrc \
            webpack-assets.json
	chmod 755 $(BUILD_DIR)/${APP_NAME}_${BRANCH_NAME}_${BUILD_NUMBER}.tar.gz
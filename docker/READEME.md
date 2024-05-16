Docker Images
=============

Introduction
------------

이 디렉터리에는 dbt-rpc 의 Docker 이미지를 빌드, 테스트, 푸시하는 스크립트를 포함합니다.
모든 단계는 로컬로 수행하거나 Github Actions를 사용하여 수행할 수 있습니다.

GitHub Actions
--------------

TBD

Building image and running tests using GitHub Actions
----------------------------------------------------

TBD

Creating a Release Candidate using GitHub Actions
-------------------------------------------------

TBD

Local Setup
-----------

테스트와 스크립트를 실행하기 전 Python(>= 3.10.x)이 설치되어 있는지 확인해주십시오.

스크립트 실행을 위한 모든 요구 사항을 얻으려면 `pip install -r requirements.txt`를 실행하세요.

buildx 지원이 활성화된 docker 가 설치되어 있는지 확인하세요. (다중 아키텍처 이미지를 Docker 레지스트리에 푸시하는 경우)

Building image and running tests locally
---------------------------------------

- `docker_build_test.py`: 도커 이미지를 빌드하고 테스트합니다.
  - 이미지를 빌드하려면 이미지 이름, 태그 및 유형이 필요합니다. 자세한 사용법 설명은 `python docker_build_test.py --help`를 확인하세요.
- `test_docker_sanity_test.py`: docker 이미지에 대한 새너티 테스트를 실행합니다.
- 기본적으로 이미지가 빌드되고 테스트되며, 이미지만 빌드하려면 `--build`(또는 `-b`) 플래그를 전달합니다. 또한, 지정된 이미지만 테스트하려면 `--test`를 전달하십시오. (또는 `-t`)

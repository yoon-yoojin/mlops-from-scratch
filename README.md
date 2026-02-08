# mlops-from-scratch

MLOps 스캐폴딩 프로젝트입니다.

## 프로젝트 구조

```
├── src/
│   ├── __init__.py
│   └── app.py              # FastAPI 앱 (헬스체크 엔드포인트)
├── tests/
│   ├── test_sample.py      # 샘플 테스트
│   └── load/
│       └── locustfile.py   # Locust 부하 테스트
├── .github/workflows/
│   ├── ci.yml              # CI (린트 + 테스트)
│   ├── docker-publish.yml  # Docker 이미지 빌드 및 ghcr.io 배포
│   └── load-test.yml       # 부하 테스트 자동화
├── Dockerfile
├── Makefile
├── requirements.txt
└── requirements-dev.txt
```

## 요구사항

- Python >= 3.9

## 설치

### 프로덕션 의존성 설치

```bash
make install
```

### 개발 의존성 설치

```bash
make install-dev
```

## 개발

```bash
make format    # 코드 포맷팅
make lint      # 린트 검사
make test      # 테스트 실행
make all       # 포맷 + 린트 + 테스트
make clean     # 정리
```

## API 서버 실행

```bash
uvicorn src.app:app --reload
```

`http://localhost:8000/health`에서 헬스체크 엔드포인트를 확인할 수 있습니다.

## Docker

```bash
docker build -t mlops-from-scratch .
docker run -p 8000:8000 mlops-from-scratch
```

## CI/CD

| 워크플로우 | 트리거 | 설명 |
|---|---|---|
| `ci.yml` | main push / PR | 린트 + 테스트 (Python 3.9, 3.10, 3.11) |
| `docker-publish.yml` | main push | Docker 이미지 빌드 및 ghcr.io 배포 |
| `load-test.yml` | staging push | Locust 부하 테스트 실행 및 리포트 생성 |

### 부하 테스트

`staging` 브랜치에 push하면 자동으로 부하 테스트가 실행됩니다:
- Docker로 앱을 빌드하고 실행
- Locust로 30초간 10명의 가상 유저가 `/health` 엔드포인트에 부하 테스트
- HTML 리포트가 GitHub Actions Artifact로 업로드

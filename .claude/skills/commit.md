# Smart Commit Skill

이 스킬은 자동으로 커밋 메시지를 작성하고, 사용자 검토 후 커밋을 수행합니다.

## 실행 단계

1. **변경 사항 분석**
   - `git status`로 변경된 파일 확인
   - `git diff --staged`로 스테이징된 변경 내용 확인
   - 스테이징된 파일이 없으면 `git diff`로 전체 변경 확인

2. **커밋 메시지 자동 작성**
   - 변경 내용을 분석하여 적절한 커밋 메시지 작성
   - **중요: prefix(feat, fix 등)를 제외한 모든 내용은 반드시 한글로 작성**
   - 형식:
     ```
     <type>: <한글로 간결한 설명>

     <한글로 상세 설명 (필요시)>

     Co-Authored-By: Claude <noreply@anthropic.com>
     ```
   - type 종류: feat, fix, docs, style, refactor, test, chore
   - 예시:
     ```
     feat: 사용자 인증 기능 추가

     - JWT 기반 토큰 인증 구현
     - 로그인/로그아웃 API 엔드포인트 추가

     Co-Authored-By: Claude <noreply@anthropic.com>
     ```

3. **사용자 검토 요청**
   - AskUserQuestion 도구를 사용하여 작성된 커밋 메시지를 사용자에게 보여주기
   - 옵션 제공:
     - "이대로 커밋" - 메시지 그대로 사용
     - "메시지 수정" - 사용자가 직접 수정
     - "취소" - 커밋 취소

4. **커밋 실행**
   - 사용자 승인 후 `git add .` (스테이징 안된 경우)
   - `git commit` 실행
   - 결과 확인 및 보고

## 주의사항
- 커밋 메시지는 prefix를 제외하고 **반드시 한글**로 작성
- 민감한 파일(.env, credentials 등)은 커밋하지 않도록 경고
- Co-Authored-By footer는 항상 포함

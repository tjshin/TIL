# Git

## 분산 **버전 관리** 시스템

- 변경 사항만 저장



## 명령어 CLI(Command-Line Interface)

- powershell
- git bash



### vs code -> terminal -> new terminal -> powershell -> git bash



## 간단한 Unix/Linux 명령어

- 현재 위치의 폴더, 파일 목록보기 ls
- 현재 위치 이동하기 cd ( )(경로)
- 상위 폴더 이동 cd ( ) ..
- ~ : 홈 디렉토리
- 폴더 생성하기 mkdir ( )(폴더 명)
- 파일 생성하기 touch ( )(파일 명)
- 파일 삭제하기 rm ( )(파일 명)
- 폴더 삭제하기 rm -r ( )(폴더 명)



## Repository

특정 디렉토리를 버전 관리하는 저장소, 커밋 commit들이 저장되는 곳

- git init

### Working Directory

작업하고 있는 디렉토리, .git 폴더가 있는 디렉토리

### Staging Area

커밋commit으로 남기고 싶은, 특정 버전으로 관리하고 싶은 파일이 있는 곳

untracked -> **git add** -> (tracked) staged -> **git commit** -> committed -> modified

WorkDir------------------> Staging Area -------------------------> Repository -> WorkDir



- git status
- git add (파일명) ( ) (파일명) ( ) .......
- git add (.) : 모든 untracked 에 대해서
- git commit -m
- -m "aaa" : commit message 커밋 메세지는 자세하게
- git config **--global** user.email " @ .com "
- git config **--global** user.name " "
- --global --local
- git log
- git diff 두 commit 간 차이 보기

여기까지 local repository



# Github

## Remote Repository

Github Repository

- git remote add origin (url) / origin 부분은 url 이름, 관례적으로 origin
- git push -u origin master / master: 브랜치 명
- git push -u 어디로 무엇을
- -u 로컬 브랜치(master)와 리모트 브랜치 연결, 처음 한 번만

remote 먼저 만들고............

- git clone (url) / remote를 local로 복사



# ☆TIL (Today I Learned) 프로젝트

꾸준히 학습할 수 있나요?


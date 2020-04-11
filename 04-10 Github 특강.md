# 04-10 Github 특강

### 0. Prepare :

gitforwindows.org

### 1. What is Git?

*Git 버전관리시스템 DVCS

*Github:원격저장소 서비스 중 1

*Gitlab

*Bitbucket

---------------------------------

### 2. small code for bash git

$git init

​                              *git hub :             *git commit:

working directory      ->     stage          -> 

---------------------------------------

-Git bash:CLI(Command Line Interface)

:연습으로 $ touch testfile.txt

$ ls : 어떤상태인지 호출하는 명령어

-windows(GUI:그래픽기반)

-----------------------------------------

### 3.  typora 

> Git은 분산버전관리시스템(DVCS) 중 하나이다.
>
> (">"를 쓰면 인용문 처럼 쓸 수 있음)

### 4. 

#### 1). 저장소활용

```$ bash
$ git init
Reinitialized existing Git repository in C:/Users/김경한/git 연습/.git/

```

* git 저장소를 만들게 되면 해당 디렉토리 내에 .git/ 폴더가 생성

* 

* git bash 에서는 (master)라는 표기가 같이 등장한다.

  o 현재 작업중인 브랜치를 의미한다.

  #### (1) add

  git에 추가하고싶은 파일을 추가

  ```bash
  $ git status
  #Untracted files: <-git으로 버전을 남긴적이 없는 파일
  #staging area에 포함시키려면, git add
  # (커빗될 파일 목록)
  # 커밋할 내용 없지만, 트래킹 되지 않는 파일은 존재한다.
  # => working directory에는 있는데 staging area는 업다는의미
  ```

  *staging area에 추가:

  ```bash
  $ git add OO.txt  # 특정 파일
  $ git add myfolder/  # myfolder 폴더
  $ git add .        # 현재 디렉토리
  ```

  *추가 후 상태

  ```bash
  $ git status
  
  ```

  #### (2) Commit

  > 커밋 메세지는 현재 버전에 대해 명확하게 작성

  ```bash
  $ git commit -m "커밋메세지"
  
  ```

  *커밋 이력을 확인하기 위해서는 아래의 명령어 사용

  ```bash
  $ git log
  $ git log -1   # 최근 한개 커밋
  $ git log --oneline   # 간략한 로그
  $ git log --oneline -1  #최근 한개의 커밋을 간략하게
  ```

  

  

  

  *원격저장소 설정

  ```bash
  $ git remote add origin {__url__}
  ```

  

  o 원격저장소(remote)로 origin 이름으로 url을 추가

  *원격 저장소 목록

  ```bash
   git remote -v
   origin https://github.com/kyunghankim/TIL(fetch)
   origin https://github.com/kyunghankim/TIL(push)
  ```

  *원격 저장소 삭제

  ```bash
  $ git remote rm origin
  ```

  o origin 이름의 원격 저장소 설정을 삭제(remove- rm)

  

  ### 1. push

  ```bash
  $ git push origin master
  ```

  *현재 폴더를 그대로 업로드 하는 것이 아니라, 지금까지의 이력/버전(commit)을 push하는 것이다.

  *Working directory, Staging area의 변경사항들은 원격저장소로 push 되지 않는다.

  *따라서, push 전에 '$ git stats, $ git log'를 통해서 확인하는 습관을 가지자.

-------------------------------------------------------------------

# 오후 수업

clone은 최초에 원격 저장소에서 다운받고

그 다음부터는 pull push를 하면됨

## 시나리오

### 1.commit

```bash
$ git commit -m '4/10 - 케라스활용방법'
```

### 2. push

```bash
$ git push origin master
```

### 3. pull

```bash
$ git pull origin master
```

## 복습

### 1. commit

```bahs
$ git commit -m '4/10 - keras 복습'
```

### 2. push

```bash
$ git push origin master
```

# CLI

> Command Line Interface에서는 명령어와 그 결과를 항상 주의

1. ls - 디렉토리 목록

```bash
$ ls
a.txt b.txt image/
```

2. cd- 디렉토리 변경

```bash
~/Desktop/$ cd image/
~/Desktop/image/ $ cd ...
~/Desktop/ $
```

o . : 현재 디렉토리

o .. : 상위 디렉토리

o ~ : 홈 디렉토리

## Vi(Vim)

> CLI 환경에서 쓸 수 있는 텍스트 에디터 중 하나

commit 하는 과정에서 멧지 옵션을 쓰지 않으면, 나타난다

```bash
$ git commit
```

*편집모드(i) - 텍스트 편집

*명령모드(esc):

o :wq

o w: write(저장)

o q: quit




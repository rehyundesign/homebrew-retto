# homebrew-retto

[레토(Retto)](https://github.com/rehyundesign/retto) 를 Homebrew 로 까는 탭입니다.
Claude Code·Codex 상태에 맞춰 움직이는 macOS 데스크탑 고양이.

```sh
brew tap rehyundesign/retto
brew install --cask --no-quarantine retto
```

`--no-quarantine` 을 빼도 설치는 됩니다. 다만 애플 개발자 서명이 없는 앱이라
첫 실행에서 macOS 가 막고, 시스템 설정 > 개인정보 보호 및 보안 에서
「그래도 열기」를 한 번 눌러야 합니다.

## 지우기

```sh
brew uninstall --cask retto        # 훅 등록·상태 파일까지 앱이 스스로 걷어냅니다
brew uninstall --zap --cask retto  # 남은 설정까지
```

## 이 탭이 따로 있는 이유

Homebrew 공식 탭(homebrew-cask)에는 프로젝트가 어느 정도 알려져야 들어갈 수 있습니다.
그전까지는 이 탭으로 갑니다. 설치 방법은 같습니다.

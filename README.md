# homebrew-retto

[레토(Retto)](https://github.com/rehyundesign/retto) 를 Homebrew 로 까는 탭입니다.
Claude Code·Codex 상태에 맞춰 움직이는 macOS 데스크탑 고양이.

```sh
brew tap rehyundesign/retto
brew install --cask retto
```

레토는 애플 개발자 서명이 없는 앱입니다. 이 cask 는 설치할 때 격리 표시를 떼어
macOS 경고 없이 열리게 합니다 — 옛 `--no-quarantine` 이 하던 일이고, 무엇을 하는지는
[`Casks/retto.rb`](Casks/retto.rb) 에 그대로 적혀 있습니다.

Homebrew 6.0 은 처음 보는 탭에 대해 한 번 물어봅니다. 허용하면 그다음부터는 묻지 않습니다.

릴리스의 dmg 로 직접 받으면 첫 실행에서 시스템 설정 > 개인정보 보호 및 보안 에서
「그래도 열기」를 한 번 눌러야 합니다.

## 지우기

```sh
brew uninstall --cask retto        # 훅 등록·상태 파일·자동 실행까지 앱이 스스로 걷어냅니다
brew uninstall --zap --cask retto  # 남은 설정까지
```

`brew uninstall` 은 돌고 있는 레토를 먼저 종료합니다.

## 이 탭이 따로 있는 이유

Homebrew 공식 탭(homebrew-cask)에는 프로젝트가 어느 정도 알려져야 들어갈 수 있습니다.
그전까지는 이 탭으로 갑니다. 설치 방법은 같습니다.

cask "retto" do
  version "0.9.0"
  sha256 "02c2f3f4f3d525251b06bbe5a9007e2e0410e1db9e4303bece2574c26694a003"

  url "https://github.com/rehyundesign/retto/releases/download/v#{version}/Retto-#{version}.dmg",
      verified: "github.com/rehyundesign/retto/"
  name "Retto"
  desc "Desk pet that shows what Claude Code and Codex are doing"
  homepage "https://github.com/rehyundesign/retto"

  depends_on macos: :ventura
  depends_on arch: :arm64

  app "Retto.app"

  # 격리 표시를 뗀다.
  #
  # 레토는 애플 개발자 서명이 없다. Homebrew 6.0 은 자기가 격리 표시를 새로 붙이지는 않지만,
  # 내려받은 dmg 에 붙은 것은 앱을 꺼내 옮길 때 그대로 따라간다. 그 상태로 실행하면
  # macOS 가 막고, 실측에서는 /Applications 의 앱이 아예 사라졌다.
  #
  # 예전 `--no-quarantine` 이 하던 일이고, 옛 설치.command 가 하던 일과 같다.
  # 공식 homebrew-cask 는 이 방식을 받지 않는다 — 서명을 붙이면 이 블록을 빼야 한다.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Retto.app"]
  end

  # 훅 등록·상태 파일·자동 실행까지 앱이 스스로 걷어낸다. --keep-app 은 번들을 남겨
  # brew 가 지우게 한다. 앱이 이미 없어도 제거가 멈추지 않도록 셸을 한 겹 두르고
  # 언제나 0 으로 끝낸다 — 제거가 실패하면 사용자에게 남는 길이 --force 뿐이다.
  uninstall quit:   "com.luxia.retto",
            script: {
              executable:   "/bin/sh",
              args:         [
                "-c",
                "app=\"#{appdir}/Retto.app/Contents/MacOS/Retto\"; " \
                "[ -x \"$app\" ] && \"$app\" --uninstall --keep-app; exit 0",
              ],
              must_succeed: false,
            }

  zap trash: [
    "~/.claude/retto-pet",
    "~/Library/Preferences/com.luxia.retto.plist",
  ]

  caveats <<~EOS
    상태를 읽는 훅이 node 로 돕니다. Node.js 가 없으면 고양이는 떠 있어도 움직이지 않습니다.
    처음 켜면 「레토와 Claude Code 잇기」 창이 무엇이 빠졌는지 알려줍니다.

    레토는 애플 개발자 서명이 없는 앱입니다. 이 cask 는 설치할 때 격리 표시를 떼어
    macOS 경고 없이 열리게 합니다(무엇을 하는지는 cask 소스에 그대로 적혀 있습니다).
    릴리스의 dmg 로 직접 받으면 첫 실행에서 시스템 설정 > 개인정보 보호 및 보안 에서
    「그래도 열기」를 한 번 눌러야 합니다.
  EOS
end

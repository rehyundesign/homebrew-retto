cask "retto" do
  version "0.9.0"
  sha256 "02c2f3f4f3d525251b06bbe5a9007e2e0410e1db9e4303bece2574c26694a003"

  url "https://github.com/rehyundesign/retto/releases/download/v#{version}/Retto-#{version}.dmg",
      verified: "github.com/rehyundesign/retto/"
  name "Retto"
  desc "Desk pet that shows what Claude Code and Codex are doing"
  homepage "https://github.com/rehyundesign/retto"

  depends_on macos: ">= :ventura"
  depends_on arch: :arm64

  app "Retto.app"

  # 훅과 상태 파일까지 앱이 스스로 걷어낸다. --keep-app 은 번들을 남겨 brew 가 지우게 한다.
  # must_succeed: false — node 가 없어 훅 등록을 못 빼도 제거 자체는 끝나야 한다.
  uninstall quit:   "com.luxia.retto",
            script: {
              executable:   "#{appdir}/Retto.app/Contents/MacOS/Retto",
              args:         ["--uninstall", "--keep-app"],
              must_succeed: false,
            }

  zap trash: [
    "~/.claude/retto-pet",
    "~/Library/Preferences/com.luxia.retto.plist",
  ]

  caveats <<~EOS
    레토는 애플 개발자 서명이 없는 앱입니다. 그냥 설치하면 첫 실행에서 macOS 가 막고,
    시스템 설정 > 개인정보 보호 및 보안 에서 「그래도 열기」를 한 번 눌러야 합니다.

    그 단계를 건너뛰려면 격리 표시를 붙이지 않고 설치하세요.

      brew install --cask --no-quarantine retto

    상태를 읽는 훅이 node 로 돕니다. Node.js 가 없으면 고양이는 떠 있어도 움직이지 않습니다.
    처음 켜면 「레토와 Claude Code 잇기」 창이 무엇이 빠졌는지 알려줍니다.
  EOS
end

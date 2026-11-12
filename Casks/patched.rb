cask "patched" do
  version "0.2.0"
  sha256 "0bdcc5c705d7d09ade9a0d7e4946f3804c2076c6d67f054b4bea522d98f9f6c6"

  url "https://github.com/birdseeed/patched/releases/download/v#{version}/Patched-#{version}.dmg"
  name "Patched"
  desc "Free, open source app updater that verifies each update before installing"
  homepage "https://patched.im/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Patched.app"
  binary "#{appdir}/Patched.app/Contents/Helpers/patched"

  zap trash: [
    "~/Library/Application Support/Patched",
    "~/Library/Caches/Patched",
    "~/Library/Preferences/im.patched.app.plist",
  ]
end

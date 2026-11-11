cask "patched" do
  version "0.1.8"
  sha256 "43464e83c45d5305c37297d1715a1b3273e5c21b32b7cf446d52bf6b4a740cb7"

  url "https://github.com/birdseeed/patched/releases/download/v#{version}/Patched-#{version}.dmg"
  name "Patched"
  desc "Free, open source updater for the apps on your Mac"
  homepage "https://patched.im/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: ">= :ventura"

  app "Patched.app"
  binary "#{appdir}/Patched.app/Contents/Helpers/patched"

  zap trash: [
    "~/Library/Application Support/Patched",
    "~/Library/Caches/Patched",
    "~/Library/Preferences/im.patched.app.plist",
  ]
end

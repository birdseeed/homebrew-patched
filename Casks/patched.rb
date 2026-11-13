cask "patched" do
  version "0.2.1"
  sha256 "a3961deb32952cd21d58c987b38527900fb23ef2f19be87f0b1ceeb517160fd9"

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

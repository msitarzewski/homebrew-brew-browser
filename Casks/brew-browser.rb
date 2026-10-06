cask "brew-browser" do
  arch arm: "aarch64", intel: "x64"

  version "0.7.3"
  sha256 arm:   "27af4ee808faf1577263cd39d05f60120d84e4bf57e8859ce8752c6887ea11e3",
         intel: "916bae04bd09ee1353fbb6f52f420eb9e3ce398831908c2d85d1dd849d72df5c"

  url "https://github.com/msitarzewski/brew-browser/releases/download/v#{version}/brew-browser_#{version}_#{arch}.dmg"
  name "brew-browser"
  desc "Native GUI for Homebrew"
  homepage "https://brew-browser.zerologic.com/"

  # auto_updates true: brew-browser has an in-app updater (Settings →
  # Network → Updates, off by default). This tells brew the app updates
  # itself so `brew upgrade` won't fight version drift when a user
  # self-updates. The cask version + sha256 are ALSO bumped every release
  # so `brew upgrade --cask` users stay current (Homebrew 5.2.0+
  # auto-upgrades auto_updates casks when the tap version is newer).
  #
  # `depends_on macos: :ventura` declares Ventura as the minimum
  # supported macOS version; newer releases are also allowed.
  auto_updates true
  depends_on macos: :ventura

  app "brew-browser.app"

  zap trash: [
    "~/Library/Application Support/brew-browser",
    "~/Library/Caches/com.zerologic.brew-browser",
    "~/Library/HTTPStorages/com.zerologic.brew-browser",
    "~/Library/Preferences/com.zerologic.brew-browser.plist",
    "~/Library/Saved Application State/com.zerologic.brew-browser.savedState",
    "~/Library/WebKit/com.zerologic.brew-browser",
  ]
end

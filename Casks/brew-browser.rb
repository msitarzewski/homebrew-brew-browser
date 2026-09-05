cask "brew-browser" do
  arch arm: "aarch64", intel: "x64"

  version "0.7.2"
  sha256 arm:   "a0fb3474e24837d544976f15938372d7462792ccb2f1534dcde492ea9bf98612",
         intel: "65944c5bb011d2fd84c2f90a8190d06fc7beaf86a2ed2225ae9b048f2c59bda1"

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

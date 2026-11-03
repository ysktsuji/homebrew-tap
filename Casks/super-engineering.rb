# frozen_string_literal: true

cask "super-engineering" do
  version "f157a4e0"
  sha256 "e3d522fe32225023639eab892996bcfd87bf9857c63a5c1d589242e3046673cd"

  url "https://releases.super.engineering/nightly/super.engineering-nightly-#{version}-arm64.dmg"
  name "super.engineering"
  desc "Native workspace for running parallel AI coding agents"
  homepage "https://super.engineering/"

  livecheck do
    url "https://super.engineering/api/download?arch=arm64"
    strategy :header_match do |headers|
      match = headers["location"].to_s.match(%r{/super\.engineering-nightly-([0-9a-f]+)-arm64\.dmg\z})
      match[1] if match
    end
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "super.engineering.app"
end

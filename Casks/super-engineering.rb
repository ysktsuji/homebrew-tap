# frozen_string_literal: true

cask "super-engineering" do
  version "f348a707"
  sha256 "50a3c4f2cf31d2157d6aee0a1667cbab045b24e5b858cf6d9a84c5f33ba85373"

  url "https://releases.superconductor.so/nightly/Superconductor-nightly-#{version}-arm64.dmg"
  name "super.engineering"
  desc "Native workspace for running parallel AI coding agents"
  homepage "https://super.engineering/"

  livecheck do
    url "https://super.engineering/api/download"
    strategy :header_match do |headers|
      match = headers["location"].to_s.match(%r{/Superconductor-nightly-([0-9a-f]+)-arm64\.dmg\z})
      match[1] if match
    end
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "super.engineering.app"
end

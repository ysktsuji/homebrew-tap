# frozen_string_literal: true

cask "super-engineering" do
  version "b739b94e"
  sha256 "3f229a295f9d76756fcb4ba2d8045b3d425581ac8dec8f0ed02c768746bb42f2"

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

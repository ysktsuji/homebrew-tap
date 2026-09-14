# frozen_string_literal: true

cask "super-engineering" do
  version "33171b9c"
  sha256 "0174182185591c30ce80c6cbbebae8ea8100f5ea9b0454a57557ade1e0f28801"

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

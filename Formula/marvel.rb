class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261027.181135.501b8c3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-181135-501b8c3/marvel-darwin-arm64"
    sha256 "cfcd293d98ce6722938aee3989c37089c2e6ee2bdeb98e746d441e661dc84ea2"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-181135-501b8c3/marvel-darwin-amd64"
    sha256 "782002d57d55e28d06b6dc5ce4a0a80106a87636ec4f8001e0ba8051421bf0d3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-181135-501b8c3/marvel-linux-arm64"
    sha256 "e70a363c8d15672b2a06398d61f802e562d83afe68faa1eec5c481eeef589842"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-181135-501b8c3/marvel-linux-amd64"
    sha256 "d7d002862f338725848a65de6d614403fbcff34e36c3fec63cc728552bcfc0cf"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "marvel-darwin-arm64" => "marvel"
    elsif OS.mac?
      bin.install "marvel-darwin-amd64" => "marvel"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "marvel-linux-arm64" => "marvel"
    elsif OS.linux?
      bin.install "marvel-linux-amd64" => "marvel"
    end
  end

  test do
    assert_match "marvel", shell_output("#{bin}/marvel version 2>&1")
  end
end

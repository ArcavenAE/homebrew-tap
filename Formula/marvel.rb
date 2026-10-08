class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.215013.d43c6ef"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-215013-d43c6ef/marvel-darwin-arm64"
    sha256 "1378ddfa001b74752dc88fa4a1dc9777bf89ec06bb20eea69dded67fbdafac17"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-215013-d43c6ef/marvel-darwin-amd64"
    sha256 "5f44e9e327da1b9ea333239cadc47af0880564e28746286f3a729dbc08aaef43"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-215013-d43c6ef/marvel-linux-arm64"
    sha256 "b3614e5531f3609be980e24ef94c4fec89ff70459acc3060ac0d288611e6f609"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-215013-d43c6ef/marvel-linux-amd64"
    sha256 "0a1751fafcd388727c6777b91f90616827714455962277ba67e94c333245d615"
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

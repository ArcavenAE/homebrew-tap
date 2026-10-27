class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261027.052136.884ce26"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-052136-884ce26/marvel-darwin-arm64"
    sha256 "a18b44aa92bf65d465939a90278f0878e4503a7b03f8f4ef8da53ff950dcb6f9"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-052136-884ce26/marvel-darwin-amd64"
    sha256 "ebdbc7b5b745af848aef97d6e54ca608ed8ef31fb34b98c66322962b42285eda"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-052136-884ce26/marvel-linux-arm64"
    sha256 "ac8de2611cb4e332de7d7246a5ed97943aa29431d4cb777cd27fb6c59bc42df2"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-052136-884ce26/marvel-linux-amd64"
    sha256 "f360c2d562b81c82c6e8dc200e165777a187edd35e4d25bfee24e4f3d6ac6315"
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

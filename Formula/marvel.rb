class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260805.225229.3637b57"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260805-225229-3637b57/marvel-darwin-arm64"
    sha256 "bc2cc9ad72a292f4936a75e10a3e26757d8e0eafa9c31f2e86d03e6d1de88092"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260805-225229-3637b57/marvel-darwin-amd64"
    sha256 "3e87de8f3c952a128ba32e75eb5af5c9a27cf8ec370e0fa76896fbf35d941c88"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260805-225229-3637b57/marvel-linux-arm64"
    sha256 "6d0d99381a8c9d30c24dd4b515fdee87b670c12ff38be218e90dc5ce2b515e19"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260805-225229-3637b57/marvel-linux-amd64"
    sha256 "fd84fc568115856f47f57a78a90414d7cc51d52fe4031f7355a1077a06f94cdc"
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

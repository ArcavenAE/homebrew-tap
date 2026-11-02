class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261102.201701.6172fe1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-201701-6172fe1/marvel-darwin-arm64"
    sha256 "9298b03da765f28775086ecfcf22210cd4fb83fa04393cd9189d0ba7d7d07165"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-201701-6172fe1/marvel-darwin-amd64"
    sha256 "7d89d5c089d379203860d83eb58e11debde29895a96511ae52c33879304427b1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-201701-6172fe1/marvel-linux-arm64"
    sha256 "72d94add86bd5280fa165ed161a712ea325f9b281eaa581a9fad76e630599be3"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-201701-6172fe1/marvel-linux-amd64"
    sha256 "16e71e0eb3a1615504ba07f93f7dc40c5f0f325c283a5c8f186df1693ae33189"
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

class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260809.063155.5bca7fb"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-063155-5bca7fb/marvel-darwin-arm64"
    sha256 "348f39a877ad4239ad84dfc32ef16bd2e0483b3a15a6466868fbd631015d9938"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-063155-5bca7fb/marvel-darwin-amd64"
    sha256 "63825939089fbc329265c8999e1c5a51cf104bd7019ec72558a830f426c03f6a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-063155-5bca7fb/marvel-linux-arm64"
    sha256 "e91c440f604c98cf120be6aaa5706d2f2e7361024c4643c03b21e6e0456bf5ba"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-063155-5bca7fb/marvel-linux-amd64"
    sha256 "5e3220436ce1c6d82620d4db498fee22d7d38163555e1712ab88161321d605a0"
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

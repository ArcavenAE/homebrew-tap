class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261030.203559.04c258f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-203559-04c258f/marvel-darwin-arm64"
    sha256 "93640956164d4530c2a59a5b7ebf8b5e6ac7c20f806907db040c506bdc2756f4"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-203559-04c258f/marvel-darwin-amd64"
    sha256 "f1a739fa51136301ba1d93d00a41071e6e8fdfbf532fcf4f2d9351046c8f6f02"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-203559-04c258f/marvel-linux-arm64"
    sha256 "58982d8176c2bca99cc18aa3e7c59fb347aa8457d7023b6319a4f129629931fc"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-203559-04c258f/marvel-linux-amd64"
    sha256 "eb936e328750a0fed766a23badeadb811319e1b2f526a9ab10b8ae32d4023f61"
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

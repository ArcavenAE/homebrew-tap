class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261023.224435.9fa825b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261023-224435-9fa825b/marvel-darwin-arm64"
    sha256 "dc2632263e887a656a2ba4992f9d96d6cbbe7e8c807f2364b0f5e7c3401a7526"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261023-224435-9fa825b/marvel-darwin-amd64"
    sha256 "949147315306c43e3c82ff43191d106e90cca2dc78f6edae271b49352d15c4ed"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261023-224435-9fa825b/marvel-linux-arm64"
    sha256 "05ac82d4710ba943d60a1f8f2f6ecfccb212a6b52ea64800d21bcf8f497759f1"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261023-224435-9fa825b/marvel-linux-amd64"
    sha256 "42a70b9daa6f39a927471d603d326bf5cde02470bf4e77b55de70f1fd59f5b24"
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

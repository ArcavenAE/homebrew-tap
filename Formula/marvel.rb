class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261004.053419.ae41a61"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-053419-ae41a61/marvel-darwin-arm64"
    sha256 "a14ecbef8028b355dfd2d8b7f4e405c2f1ae24743723628267803f6114e655ab"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-053419-ae41a61/marvel-darwin-amd64"
    sha256 "a2b63f00f8a0d46eb24b8b13d941c036e1472b232c67a4436204d94cb57086a2"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-053419-ae41a61/marvel-linux-arm64"
    sha256 "61c0234f06221147f63d718be560d6843498e53df16749d5d863812e867c9747"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-053419-ae41a61/marvel-linux-amd64"
    sha256 "510bbd68d25755a4276f33b93eebfe543b59ef5cd5f97fc5c44be37d729f756d"
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

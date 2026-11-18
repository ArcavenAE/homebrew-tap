class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261118.031346.dcdbd82"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261118-031346-dcdbd82/marvel-darwin-arm64"
    sha256 "98c1d83e382cd9327a4ac04f9e03b4b0efc682d23a524b0c5a7d83d728432cb2"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261118-031346-dcdbd82/marvel-darwin-amd64"
    sha256 "70fe526c7f68423c3355781318411161ad7f860e4f6feea4d81b57fafbfeeb1b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261118-031346-dcdbd82/marvel-linux-arm64"
    sha256 "acc049e88a19ef9ba1b48110935f53f2f24cb24012a46bc7a3aef91d44321266"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261118-031346-dcdbd82/marvel-linux-amd64"
    sha256 "a887d8602e9d07a84b3df9b1bbbc516c915078cb5e638fc5fdc6447e317bc408"
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

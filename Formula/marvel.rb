class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.215053.3a494a8"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-215053-3a494a8/marvel-darwin-arm64"
    sha256 "0bfdb5036329b48013358583e6e8e7a1c0c34c4cb07123fb87acbb4250ad1657"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-215053-3a494a8/marvel-darwin-amd64"
    sha256 "494a1c86f01413fd2dac429a686bd73e4447338237eab21bbf743e41122461fe"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-215053-3a494a8/marvel-linux-arm64"
    sha256 "b64e13e7487a69046bd0df3f62fd7074f80f6dcd42745210618c2ec5ff5f4d9b"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-215053-3a494a8/marvel-linux-amd64"
    sha256 "f25c57f1c2a64a0f1085639547712cfb591b7b1c7380edcad4239fbae0dde4fb"
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

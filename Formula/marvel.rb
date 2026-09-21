class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260921.173533.8467c33"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260921-173533-8467c33/marvel-darwin-arm64"
    sha256 "f4b02740b2421ce09b7109929ee55ce6f7e213cdbedf554f96284ac845585dba"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260921-173533-8467c33/marvel-darwin-amd64"
    sha256 "fd46b5f6ef0efbdabf831ab4214ab189d12614c684f2d878fc40cee12d47f4a9"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260921-173533-8467c33/marvel-linux-arm64"
    sha256 "abdfdee4d9ff5000e490dbcf48e76b187842466c704a3db9501882c3e7a71806"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260921-173533-8467c33/marvel-linux-amd64"
    sha256 "91727a9e2bc121c11e297552a455b80e2c018044585825102c5e56cf756c51da"
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

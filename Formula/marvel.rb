class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261101.025501.decd446"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-025501-decd446/marvel-darwin-arm64"
    sha256 "857134299bdc0a4e82c5c104e257934f7d0d7db656dbcc2c150f82f1e8482641"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-025501-decd446/marvel-darwin-amd64"
    sha256 "aa1e4cb4855c7d00119c0ad4c87e8ec9cbc989b6b8848ba13673c6da61d472f5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-025501-decd446/marvel-linux-arm64"
    sha256 "f6715f95387debf69b3a53df6397a4c7eb3f748dae6f574ff3fafeca7add5cef"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-025501-decd446/marvel-linux-amd64"
    sha256 "99b4dd0c55591dbb4c6531a9605ee91808a7b1b02f1779ded6793648369a88a6"
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

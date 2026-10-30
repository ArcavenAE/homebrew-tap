class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261030.231201.3979ec6"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-231201-3979ec6/marvel-darwin-arm64"
    sha256 "4a7a936d5371c9b3f1230940495fcf3633ceebf5a81f521b5fad1df660655711"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-231201-3979ec6/marvel-darwin-amd64"
    sha256 "98a1bb3a48fe8849e963ce16f6acc611c9d89ed0f03081f7ed5bf2407007303b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-231201-3979ec6/marvel-linux-arm64"
    sha256 "b357b12a7c6066243445a1e6bbcaec520a20b05781bc8fbed9d2c6c29fcd7f37"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-231201-3979ec6/marvel-linux-amd64"
    sha256 "e55475ed435157482098889feb3fab28396bb05dd20448fa7358f1900191672c"
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

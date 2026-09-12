class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260912.231113.b3f483d"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260912-231113-b3f483d/marvel-darwin-arm64"
    sha256 "db4970fdbe51c12fabfd486d966da6861ed662df4abac1e02f1d1f1fcbb4c7e8"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260912-231113-b3f483d/marvel-darwin-amd64"
    sha256 "ad0c0e2a56f23153e4a2330ae8acc2c60c37a4d4d38e6dd34822b93b2d772916"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260912-231113-b3f483d/marvel-linux-arm64"
    sha256 "73bbc71b30f44aace890b448aafa6a033a187e39e65847d2f7de56e63532a334"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260912-231113-b3f483d/marvel-linux-amd64"
    sha256 "bea2cc657adb7b1334f65019d620c93686c4269791569e9148bbf8adea387cc3"
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

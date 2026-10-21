class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261021.222810.a29e570"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-222810-a29e570/marvel-darwin-arm64"
    sha256 "c7853d1c8becf87e95e0f095756a2be6106371d35bd5bf9654fc3cf9ea0d22b4"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-222810-a29e570/marvel-darwin-amd64"
    sha256 "79129852b7b32f45fad369a9c1aac42eed2e3cf0f86f626224ae93a9b89ffb19"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-222810-a29e570/marvel-linux-arm64"
    sha256 "99ba6f762524f7bef80c83feff475fd2e75cabbc35af3f35f065e3f0a21f65a4"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-222810-a29e570/marvel-linux-amd64"
    sha256 "c3ffa922a69f361c925a3c90daf840cc4aec34fdaeecd88dbe01cdb80377e3b8"
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

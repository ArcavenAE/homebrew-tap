class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260809.064619.281a5c5"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-064619-281a5c5/marvel-darwin-arm64"
    sha256 "468e5465969191ae6fdf0ca216da3970d5ba725ae9cabae418120da8aa151696"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-064619-281a5c5/marvel-darwin-amd64"
    sha256 "cd056dc067ebd848c1df847a3938c61e95f9a280d23fc6c99716535d9f659d4a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-064619-281a5c5/marvel-linux-arm64"
    sha256 "2af88ec976c9a2a444c7ad5833e2c77596ba1251e1bd222717bb3c0538b6fac7"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-064619-281a5c5/marvel-linux-amd64"
    sha256 "7f0b410253ddc1ae08f3500b0a8991aa08660b137f44eb399d5c79e870b17ea0"
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

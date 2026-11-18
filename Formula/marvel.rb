class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261118.164107.1fc2922"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261118-164107-1fc2922/marvel-darwin-arm64"
    sha256 "a62238c6e5f1fca19a33bcc7cc9cb7a58f9cedc144a9f099996e077d42797c7d"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261118-164107-1fc2922/marvel-darwin-amd64"
    sha256 "a5919caa00625cc1c2266aafbdd15b0e99ecc1f8c02e8da051749020056b173f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261118-164107-1fc2922/marvel-linux-arm64"
    sha256 "7e759f0aabd02d257fcc75e002253102473a912d9f224e89a2114f93457ca70f"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261118-164107-1fc2922/marvel-linux-amd64"
    sha256 "cc4429621102e480a3949dce44242a1d201885bab8cdd209e1a0959b8b56cc49"
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

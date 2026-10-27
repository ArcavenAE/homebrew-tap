class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261027.062902.c7c1dc7"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-062902-c7c1dc7/marvel-darwin-arm64"
    sha256 "8fbf7fd9b9d3764afcf981cb8246e76d26113a765d357852794112936f91d489"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-062902-c7c1dc7/marvel-darwin-amd64"
    sha256 "ea5558d55b18d2fa5159495e8b89aeab6fd093e2ca0109e2a1f9cbc717f26a8d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-062902-c7c1dc7/marvel-linux-arm64"
    sha256 "29cb9ff6056b7ba7f75e1e0035fd293133875d295b38b457c86be06b426928d1"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-062902-c7c1dc7/marvel-linux-amd64"
    sha256 "f679609692c0274c523852e78457a21655525dda8ada51e1907cb45fd1d22398"
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

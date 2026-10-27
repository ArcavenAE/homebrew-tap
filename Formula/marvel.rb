class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261027.153307.a9c91fe"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-153307-a9c91fe/marvel-darwin-arm64"
    sha256 "6e859ffefc361808d4a07e414ebe199358807d3d709087ef69116c75098176c3"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-153307-a9c91fe/marvel-darwin-amd64"
    sha256 "9d32f11dd4deb4ac74243624474afaa4675fecaded1d49b9e4d89671dd6a3028"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-153307-a9c91fe/marvel-linux-arm64"
    sha256 "b6474e5a270db8b33f96f33a79f0bcee4e6a4dcdc3a603844ee484890c3bd960"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-153307-a9c91fe/marvel-linux-amd64"
    sha256 "ee7d8094d0cf6922c9f4d78558b601d5feea90ba5f33a78c0d8c891200ef408a"
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

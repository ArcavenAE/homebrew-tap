class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260916.163858.eb65893"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260916-163858-eb65893/marvel-darwin-arm64"
    sha256 "c20c793fe2b2a39322865da4aafbc4e13c47a916e2c99550050b3591ae332c93"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260916-163858-eb65893/marvel-darwin-amd64"
    sha256 "6a2b8cc2006a63270cbf04e45c97ad89d9b0439dbf1113e5c48e3f09c4c8683b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260916-163858-eb65893/marvel-linux-arm64"
    sha256 "c5bacf7adc36ca4dcfd367d3b11fcb69df1561446644595581fcbb1a273333a6"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260916-163858-eb65893/marvel-linux-amd64"
    sha256 "1a545e482d3559a73c79d122bd321539f080859e36d871117571a83b0cc0e74f"
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

class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260904.161823.454b8e5"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260904-161823-454b8e5/marvel-darwin-arm64"
    sha256 "005259010294899b5a13c281d4bea785b4e6f703b6e9870a13ff2683bd7e7116"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260904-161823-454b8e5/marvel-darwin-amd64"
    sha256 "3cc187c32871a417940c02318180086a2fac2e1eb1eae8c55e08d08327cc75ff"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260904-161823-454b8e5/marvel-linux-arm64"
    sha256 "7d221ecd2d4ca44d9d7c4b786a1575cb4b58b2d47ef26fca782c4b259378ca0e"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260904-161823-454b8e5/marvel-linux-amd64"
    sha256 "2ad69ee0366a18a9fb35edf8e76ace24d61da41d798d9f3289dcc7b132505e54"
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

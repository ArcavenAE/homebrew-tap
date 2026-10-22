class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261022.234521.099436a"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-234521-099436a/marvel-darwin-arm64"
    sha256 "3a417d0faeed33423ca8faf14a808d21d8fb729f80b3f5a81bd73c5e5e1c9936"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-234521-099436a/marvel-darwin-amd64"
    sha256 "cf3a30b0cb01c42e6a8c7c41ad1c9b4e8b3c248c0b70af04a6a634aaec65e155"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-234521-099436a/marvel-linux-arm64"
    sha256 "a5302599dcc97c8000b8451a2f52bf949d19d2390c9f310aca407956c0840727"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-234521-099436a/marvel-linux-amd64"
    sha256 "3d0ff0ace18550e52ba5c41baca12dfbc4a14333e9b3b3921ecf41ea01426773"
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

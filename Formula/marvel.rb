class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.212112.469df06"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-212112-469df06/marvel-darwin-arm64"
    sha256 "a17c1062ac4de0c4c1d2d39b73cc5fcde15fa286f6380a0bb0517609a12eccfa"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-212112-469df06/marvel-darwin-amd64"
    sha256 "1847263cfee90c84c0d4aed87790e2b73c0059ed26dd558031d54174cfa84197"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-212112-469df06/marvel-linux-arm64"
    sha256 "cfc6b492a0d68637f834f045077b12378764610aa4b0a46d1f302c9191d5b418"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-212112-469df06/marvel-linux-amd64"
    sha256 "3f9be9f84c577ecd09449dded1790f3d5a5b8526518f46f4f5c985698f451b59"
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
